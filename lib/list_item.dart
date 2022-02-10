import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
