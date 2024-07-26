import 'package:flutter/material.dart';
import 'package:practiceapp/models/my_cart.dart';
import 'package:practiceapp/pages/home_detail_page.dart';
import 'package:practiceapp/utils/routes.dart';
import 'package:practiceapp/widgets/theme.dart';

import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Row(
        children: [
          Hero(
            tag: catalog.id,
            child: CatalogImage(image: catalog.image)
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalog.name.text.bold.xl.color(MyTheme.darkBluishColor).make(),
              catalog.desc.text
                  .textStyle(context.captionStyle)
                  .make()
                  .pOnly(bottom: 4),
              Padding(
                padding: const EdgeInsets.all(0),
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.xl.bold.make(),
                    ElevatedButton(
                      onPressed: (){},
                      child: "Buy".text.white.make(),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(MyTheme.darkBluishColor),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              "color: ${Color(int.parse(catalog.color.substring(1, 7), radix: 16) + 0xFF000000)}"
                  .text
                  .make(),
            ],
          ))
        ],
      ),
    )).white.rounded.square(140).make().py8();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.make().p12();
  }
}
