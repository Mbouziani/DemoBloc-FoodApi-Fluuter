import 'package:demobloc/FoodController.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'Strings.dart';
import 'list_item.dart';
import 'shimmer_list_item.dart';

class foodscreen extends StatefulWidget {
  const foodscreen({Key? key}) : super(key: key);

  @override
  State<foodscreen> createState() => _foodscreenState();
}

class _foodscreenState extends State<foodscreen> {
  String? item = countryFood[2].toString();

  DropdownMenuItem<String> buildmenuitem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(color: Colors.white),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
        backgroundColor: Colors.black,
        actions: [
          DropdownButton<String>(
              dropdownColor: Colors.black,
              value: item,
              items: countryFood.map(buildmenuitem).toList(),
              onChanged: (value) {
                setState(() {
                  item = value;
                });
              })
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: ControllerFood.getfood(item!),
          builder: (context, AsyncSnapshot<List> snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) => listitem(snapshot.data, i),
                  )
                : Shimmeritem(10);
          },
        ),
      ),
    );
  }
}
