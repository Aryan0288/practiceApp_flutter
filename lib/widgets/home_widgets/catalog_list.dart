import 'package:flutter/material.dart';
import 'package:practiceapp/models/my_cart.dart';
import 'package:practiceapp/pages/home_detail_page.dart';
import 'package:practiceapp/pages/home_page.dart';
import 'package:practiceapp/widgets/home_widgets/catalog_item.dart';
import 'package:velocity_x/velocity_x.dart';

class CataLogList extends StatelessWidget {
  const CataLogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CataLogModel.item.length,
        itemBuilder: (context, index) {
          final item = CataLogModel.item[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,MaterialPageRoute(builder: (context)=>HomeDetailPage(catalogUniqueItem: item))
              );
            },
            child: CatalogItem(
              catalog: item,
            ),
          );
        });
  }
}
