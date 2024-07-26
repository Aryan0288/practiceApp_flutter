import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practiceapp/models/my_cart.dart';
import 'package:practiceapp/widgets/home_widgets/catalog_list.dart';
import 'package:practiceapp/widgets/home_widgets/catatlog_header.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///  this is one

  @override
  void initState() {
    super.initState();
    loadState();
  }

  loadState() async {
    print("I am loadState");
    await Future.delayed(Duration(seconds: 1));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var procData = decodeData["products"];
    print(procData);
    CataLogModel.item =
        List.from(procData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32.0), // Replace Vx.m32 with EdgeInsets.all
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ensure the list contains only Widgets
              const CatalogHeader(),
              if (CataLogModel.item.isNotEmpty)
                const CataLogList().expand()
              else
                 const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}





