import 'package:flutter/material.dart';
import 'package:practiceapp/models/my_cart.dart';
import 'package:practiceapp/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalogUniqueItem});

  final Item catalogUniqueItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalogUniqueItem.price}".text.xl3.red500.bold.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Buy".text.xl2.white.make(),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(MyTheme.darkBluishColor),
                // shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                //   RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(6.0),
                //   ),
                // ),
              ),
            ).wh(150, 45)
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: catalogUniqueItem.id,
                    child: Image.network(catalogUniqueItem.image).wh(200, 300).centered()),
            catalogUniqueItem.name.text.bold.xl4
                .color(MyTheme.darkBluishColor)
                .make(),
            catalogUniqueItem.desc.text.xl
                .textStyle(context.captionStyle)
                .make()
                .pOnly(bottom: 4),
          ],
        ),
      ),
    );
  }
}
