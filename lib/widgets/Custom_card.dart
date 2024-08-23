import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/views/UpdateProduct.dart';

class Custom_Card extends StatelessWidget {
  Custom_Card({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // height: 130,
          // width: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                offset: Offset(10, 10),
                color: Colors.grey.withOpacity(0.5),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Updateproduct.routeName,
                  arguments: product);
            },
            child: Card(
              shape: RoundedRectangleBorder(),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title.substring(0, 6)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.price.toString()),
                        Icon(Icons.favorite, color: Colors.red)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 70,
          right: 32,
          child: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
}
