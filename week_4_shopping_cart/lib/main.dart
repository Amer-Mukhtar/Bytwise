import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_4_shopping_cart/Widgets/constants.dart';
import 'models/cart.dart';
import 'Screens/cartScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Pant', price: 10.0,img: 'images/pants.jpg'),
    Product(name: 'Shoes', price: 20.0,img: 'images/shoes.jpg'),
    Product(name: 'Shirt', price: 30.0,img: 'images/shirt.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Shopping Cart App',style: TextStyle(color: black,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
            },
            icon: const Icon(
              CupertinoIcons.cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20,left: 10,right: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 25,),
            Container(margin: EdgeInsets.symmetric(horizontal: 10),
                child: Align(alignment: Alignment.topLeft,child:
                Text('    Our Products',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                      height: 180,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding:EdgeInsets.all(5),
                      child: Image(image: AssetImage(products[index].img),)),
                    subtitle: Row(
                      children: [
                        SizedBox(width: 30,),
                        Text(products[index].name,style: TextStyle(color: yellow1)),
                        Text('   \$${products[index].price}',style: TextStyle(color: white)),
                        SizedBox(width: 160,),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart,color: yellow,size: 20,),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false).addItem(products[index]);
                          },
                        )
                        ,
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
