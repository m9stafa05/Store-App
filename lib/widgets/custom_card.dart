import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/updata_product_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdataProductPage.id,
          arguments: widget.product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.grey.withValues(alpha: .2),
                  spreadRadius: 1,
                  offset: Offset(7, 8),
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image(image: AssetImage('images/shoes.jpg')),
                    Text(
                      widget.product.title.substring(0, 15),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price.toString()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        IconButton(
                          icon:
                              isFav
                                  ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                  : Icon(Icons.favorite_border),
                          onPressed: () {
                            isFav = !isFav;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            right: 16,
            bottom: 120,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}
