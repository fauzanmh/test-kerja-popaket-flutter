import 'package:flutter/material.dart';

import 'package:test_kerja_popaket_flutter/src/model/product.dart';
import 'package:test_kerja_popaket_flutter/src/pages/product_detail.dart';
import 'package:test_kerja_popaket_flutter/src/themes/light_color.dart';
import 'package:test_kerja_popaket_flutter/src/widgets/title_text.dart';
import 'package:test_kerja_popaket_flutter/src/widgets/extentions.dart';

import 'package:test_kerja_popaket_flutter/src/model/data.dart';

import 'package:test_kerja_popaket_flutter/src/themes/theme.dart';

import 'title_text.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;
  ProductCard({Key key, this.product, this.onSelected}) : super(key: key);
  List circleColor = [
    Colors.pink[50],
    Colors.lightBlue[100],
    Colors.lightBlue[50],
    Colors.orange[50],
  ];

  @override
  Widget build(BuildContext context) {
    var remaining = product.rating;
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    product.disc != ''
                        ? Container(
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                              color: Colors.lightBlue[300],
                              boxShadow: AppTheme.shadow,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: TitleText(
                                text: product.disc,
                                fontSize: 11,
                              ),
                            ),
                          )
                        : Container(),
                    Spacer(),
                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: product.isliked
                          ? Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.red[400]),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ))
                          : FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Icon(
                                Icons.favorite,
                                size: 20,
                              ),
                            ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: product.isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: circleColor[
                            AppData.productList.indexOf(product) %
                                circleColor.length],
                      ),
                      CircleAvatar(radius: 37, backgroundColor: Colors.white),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: circleColor[
                            AppData.productList.indexOf(product) %
                                circleColor.length],
                      ),
                      Image.asset(product.image)
                    ],
                  ),
                ),
                SizedBox(height: 5),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: TitleText(
                    text: product.name,
                    fontSize: 12,
                    color: Colors.indigo,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                ),
                TitleText(
                  text: "\$ " + product.price.toString(),
                  fontSize: 16,
                  color: Colors.indigo,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      if (index < 5) {
                        if (remaining <= 0) {
                          remaining -= 1;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.5),
                            child: Icon(
                              Icons.star,
                              size: 12,
                            ),
                          );
                        } else {
                          if (remaining >= 1) {
                            remaining -= 1;
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.5),
                              child: Icon(
                                Icons.star,
                                size: 12,
                                color: Colors.yellow,
                              ),
                            );
                          } else {
                            remaining -= 1;
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.5),
                              child: Icon(
                                Icons.star_half,
                                size: 12,
                                color: Colors.yellow,
                              ),
                            );
                          }
                        }
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5),
                          child: TitleText(
                            text: "(" + product.rating.toString() + ")",
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      }
                    }))
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail',
            arguments: ProductSelected(
                product,
                circleColor[AppData.productList.indexOf(product) %
                    circleColor.length]));
        onSelected(product);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
