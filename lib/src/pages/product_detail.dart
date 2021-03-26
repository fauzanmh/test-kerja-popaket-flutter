import 'package:flutter/material.dart';
import 'package:test_kerja_popaket_flutter/src/themes/light_color.dart';
import 'package:test_kerja_popaket_flutter/src/themes/theme.dart';
import 'package:test_kerja_popaket_flutter/src/widgets/title_text.dart';
import 'package:test_kerja_popaket_flutter/src/widgets/extentions.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _appBar(product) {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(
            Icons.arrow_back,
            color: Colors.black54,
            size: 18,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Image.asset('assets/logo.png',
              height: MediaQuery.of(context).size.width * .08),
          product.isliked
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
        ],
      ),
    );
  }

  Widget _icon(
    IconData icon, {
    Color color = LightColor.iconColor,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _disc(disc) {
    return disc != ''
        ? Container(
            width: AppTheme.fullWidth(context) * .15,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.lightBlue[300],
              boxShadow: AppTheme.shadow,
            ),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: TitleText(
                text: disc,
                fontSize: 11,
              ),
            ),
          )
        : Container();
  }

  Widget _productImage(image, circleColor) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 110,
          backgroundColor: circleColor,
        ),
        CircleAvatar(radius: 80, backgroundColor: Colors.white38),
        Image.asset(image)
      ],
    );
  }

  Widget _detailWidget(product) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: AppTheme.padding.copyWith(bottom: 0),
            child: Column(
              children: [
                SizedBox(height: 5),
                SizedBox(height: 10),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TitleText(
                          text: product.name,
                          fontSize: 25,
                          color: Colors.indigo,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.yellow,
                            ),
                            TitleText(
                              text: "(" + product.rating.toString() + ")",
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TitleText(
                      text: product.description,
                      color: Colors.indigo,
                      fontSize: 12,
                    ),
                  ],
                )),
                SizedBox(
                  height: 20,
                ),
                _availableSize(),
                SizedBox(
                  height: 20,
                ),
                _availableColor(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          _price(product.price)
        ],
      ),
    );
  }

  Widget _availableSize() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: "Size",
          fontSize: 14,
          color: Colors.grey,
        ),
        _sizeWidget("US 6"),
        _sizeWidget("US 7", isSelected: true),
        _sizeWidget("US 8"),
        _sizeWidget("US 9"),
      ],
    );
  }

  Widget _sizeWidget(String text,
      {Color color = LightColor.iconColor, bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: isSelected
            ? Colors.lightBlue[200]
            : Theme.of(context).backgroundColor,
      ),
      child: TitleText(
        text: text,
        fontSize: 16,
        color: LightColor.titleTextColor,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _availableColor() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: "Available Color",
          fontSize: 14,
          color: Colors.grey,
        ),
        _colorWidget(LightColor.yellowColor, isSelected: true),
        _colorWidget(LightColor.lightBlue),
        _colorWidget(LightColor.black),
        _colorWidget(LightColor.red),
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }

  Widget _price(price) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: AppTheme.fullWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              children: [
                TitleText(
                  text: "\$ ",
                  fontSize: 13,
                ),
                TitleText(
                  text: price.toString(),
                  fontSize: 28,
                ),
              ],
            ),
          ),
          FlatButton(
              onPressed: () => {},
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 14,
                    color: Colors.indigo,
                  ),
                  TitleText(
                    text: "  Add to Cart",
                    fontSize: 14,
                    color: Colors.indigo,
                  )
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProductSelected args = ModalRoute.of(context).settings.arguments;
    final product = args.product;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xfffbfbfb),
              Color(0xfff7f7f7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _appBar(product),
                  _disc(product.disc),
                  SizedBox(
                    height: 30,
                  ),
                  _productImage(product.image, args.circleColor),
                  SizedBox(
                    height: 25,
                  ),
                  _detailWidget(product),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductSelected {
  final product;
  final circleColor;

  ProductSelected(this.product, this.circleColor);
}
