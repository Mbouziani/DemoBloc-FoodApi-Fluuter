import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget Shimmeritem(int countitem) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: countitem,
        itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.orange,
                    ),
                    height: 160,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.orange,
                    ),
                  )
                ],
              ),
            )),
  );
}
