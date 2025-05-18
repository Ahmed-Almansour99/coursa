import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';

Widget buildShimmerItem(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.getHeight(per:2) ,
            width: context.getWidth(per:4.7),
             decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          const SizedBox(height: 8),
         
        ],
      ),
    );
  }