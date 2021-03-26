import 'package:flutter/material.dart';
import 'package:test_kerja_popaket_flutter/src/model/category.dart';
import 'package:test_kerja_popaket_flutter/src/themes/light_color.dart';
import 'package:test_kerja_popaket_flutter/src/themes/theme.dart';
import 'package:test_kerja_popaket_flutter/src/widgets/title_text.dart';
import 'package:test_kerja_popaket_flutter/src/widgets/extentions.dart';

class ProductIcon extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;
  ProductIcon({Key key, this.model, this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: LightColor.background,
                boxShadow: <BoxShadow>[
                  model.isSelected
                      ? BoxShadow(
                          color: Colors.black12,
                          blurRadius: 7,
                          spreadRadius: .1,
                          offset: Offset(5, 5),
                        )
                      : BoxShadow(color: Colors.transparent),
                ],
              ),
              child: Row(
                children: <Widget>[
                  model.image != null
                      ? Image.asset(
                          model.image,
                          height: MediaQuery.of(context).size.width * 0.1,
                        )
                      : SizedBox(),
                  model.name == null
                      ? Container()
                      : Container(
                          child: TitleText(
                            text: model.name,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
