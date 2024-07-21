import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_4_shopping_cart/Widgets/constants.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: yellow),
        backgroundColor: black,
        title: Text(
          'Cart',
          style: TextStyle(color: yellow, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          List<Map<String, dynamic>> uniqueItems = [];

          for (var item in cart.items) {
            bool itemExists = false;

            for (var uniqueItem in uniqueItems)
            {
              if (uniqueItem['name'] == item.name)
              {
                uniqueItem['quantity']++;
                itemExists = true;
                break;
              }
            }

            if (!itemExists)
            {
              uniqueItems.add({
                'img':item.img,
                'name': item.name,
                'price': item.price,
                'quantity': 1,
              });
            }
          }

          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 160,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.yellow,
                ),
                child: Center(
                  child: Text(
                    'Total Cost: \$${cart.totalPrice}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: uniqueItems.length,
                  itemBuilder: (context, index) {
                    final item = uniqueItems[index];
                    return ListTile(
                      leading: Container(width:100,height:100,child: Image(image: AssetImage(item['img']),)),
                      title: Text(item['name'], style: TextStyle(color: yellow1)),
                      subtitle: Row(
                        children: [
                          Text('\$${item['price']}', style: TextStyle(color: white)),
                          Text(' | Qt:${item['quantity']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart, color: yellow),
                        onPressed: (){
                          final itemsToRemove = cart.items.where(
                                (i) => i.name == item['name'],
                          ).toList();

                          if (itemsToRemove.isNotEmpty) {
                            cart.removeItem(itemsToRemove.first);
                          }

                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
