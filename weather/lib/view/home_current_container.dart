import 'package:flutter/material.dart';

Widget currentContainer() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "9 °",
              textScaleFactor: 4,
            ),
            Text(
              "Sereno",
              textScaleFactor: 3,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_upward_outlined),
                    Text("11°C"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_upward_outlined),
                    Text("11°C"),
                  ],
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Icon(Icons.ac_unit),
                  Text("9%"),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Icon(Icons.ac_unit),
                  Text("9%"),
                ],
              ),
            ),
          ],
        )
      ],
    );
