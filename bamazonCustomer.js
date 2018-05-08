var mysql = require('mysql');
var prompt = require('prompt');
var colors = require('colors/safe');
var Table = require('cli-table');
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'bamazon', 
});

var productPurchased = [];

connection.connect();


connection.query('SELECT item_id, product_name, price FROM Products', function(err, result){
	if(err) console.log(err);

	
	var table = new Table({
		head: ['Item Id#', 'Product Name', 'price'],
		style: {
			head: ['blue'],
			compact: false,
			colAligns: ['center'],
		}
	});

	
	for(var i = 0; i < result.length; i++){
		table.push(
			[result[i].item_id, result[i].product_name, result[i].price]
		);
	}
	console.log(table.toString());

	purchase();
});


var purchase = function(){

	
	var productInfo = {
		properties: {
			item_id:{description: colors.blue('Please enter the ID # of the item you wish to purchase.')},
			Quantity:{description: colors.green('How many items would you like to purchase?')}
		},
	};

	prompt.start();

	
	prompt.get(productInfo, function(err, res){

		
		var custPurchase = {
			item_id: res.item_id,
			Quantity: res.Quantity
		};
		
		
		productPurchased.push(custPurchase);

		
		connection.query('SELECT * FROM Products WHERE item_id=?', productPurchased[0].item_id, function(err, res){
				if(err) console.log(err, 'That item ID doesn\'t exist');
				
				//if the stock quantity available is less than the amount that the user wanted to purchase then the user will be alerted that the product is out of stock
				if(res[0].stock_quantity < productPurchased[0].Quantity){
					console.log('That product is out of stock!');
					connection.end();

				//otherwise if the stock amount available is more than or equal to the amount being asked for then the purchase is continued and the user is alerted of what items are being purchased, how much one item is and what the total amount is
				} else if(res[0].stock_quantity >= productPurchased[0].Quantity){

					console.log('');

					console.log(productPurchased[0].Quantity + ' items purchased');

					console.log(res[0].product_name + ' ' + res[0].price);

			
					var saleTotal = res[0].price * productPurchased[0].Quantity;


					console.log('Total: ' + saleTotal);

				
					newQuantity = res[0].stock_quantity - productPurchased[0].Quantity;
			
					
					connection.query("UPDATE Products SET stock_quantity = " + newQuantity +" WHERE item_id = " + productPurchased[0].item_id, function(err, res){
						
						console.log('');
						console.log(colors.cyan('Your order has been processed.  Thank you for shopping at Bamazon!'));
						console.log('');

						connection.end();
					})

				};

		})
	})

};