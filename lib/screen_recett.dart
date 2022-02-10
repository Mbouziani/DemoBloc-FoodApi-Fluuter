import 'package:demobloc/FoodController.dart';
import 'package:flutter/material.dart';

import 'Foodmodel.dart';

class foodscreen extends StatefulWidget {
  const foodscreen({Key? key}) : super(key: key);

  @override
  State<foodscreen> createState() => _foodscreenState();
}

class _foodscreenState extends State<foodscreen> {
  final country = [
    'African',
    'British',
    'Cajun',
    'Caribbean',
    'Chinese',
    'Eastern European',
    'European',
    'French',
    'German',
    'Greek',
    'Indian',
    'Irish',
    'Italian',
    'Japanese',
    'Jewish',
    'Korean',
    'Latin American',
    'Mediterranean',
    'Mexican',
    'Middle Eastern',
    'Nordic',
    'Southern',
    'Spanish',
    'Thai',
    'Vietnamese',
  ];
  String? item = 'Italian';

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
              items: country.map(buildmenuitem).toList(),
              onChanged: (value) {
                setState(() {
                  item = value;
                });
              })
        ],
      ),
      body: Container(
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
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

Widget listitem(var data, i) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: NetworkImage(
                data![i].image,
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 0.75))
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                //color: Color(0xaa000000),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black87,
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(12.0)),
              ),
              width: double.infinity,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  data![i].title, // data[index]["title"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )),
            ))
      ],
    ),
  );
}
