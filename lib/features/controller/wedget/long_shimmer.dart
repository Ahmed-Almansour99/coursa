import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';

Widget buildLongShimmerItem(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: context.getHeight(per:2) ,
              width: context.getWidth(per:9.5),
               decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            const SizedBox(height: 8),
           
          ],
        ),
      ),
    );
  }