import 'package:flutter/material.dart';

Widget categoryItem({
    required String image,
    required String title,
  }) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(//child: Image.asset(image)
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(image),
            fit: BoxFit.cover)
          ),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }