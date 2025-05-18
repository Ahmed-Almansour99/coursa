//import packages
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
//unit group class
class ProgressContainer extends StatelessWidget {
  
  final Map<String, Map<String, dynamic>> containerGroub;
  
// class keys
  const ProgressContainer({
    super.key,
    required this.containerGroub,

  });

  @override
  Widget build(BuildContext context) {
    //get width of screen
    
//start with column
    return SizedBox(
      child: Container(alignment: Alignment.topLeft,  width: context.getWidth(per:4.8),height: context.getHeight(per:2.3),
        child: Column(
          children: [
            
            
            SizedBox(
              height: context.getHeight(per:2.3),
              //horzintal list view
              child: Column(
                
                //define the keys of map
                children: containerGroub.entries.map((entry) {
                  final name = entry.key;
                  final containerData = entry.value;
                  final centerImage = containerData['centerimage']??'assets/images/goals.png';
                  final start = containerData['start'] ?? 0.00;
                  final end = containerData['end'] ?? 0.00;
                  
                  final progress = end > 0.00 ? start / end : 0.00;
        
                    return Container(
                      height: context.getHeight(per:2.2),
                      margin: EdgeInsets.symmetric(horizontal: context.getWidth(per:0.1)),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color:AppPalette.beigeLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Stack(clipBehavior: Clip.none,
                            children:[ Positioned(left: 0,right: 0, top:context.getHeight(per: 0.54),child:  Opacity(opacity: 0.30, child: Image.asset(centerImage,height: context.getHeight(per: 0.8),width: context.getWidth(per: 0.8),))),
                            SizedBox(height: context.getHeight(per: 1.9),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: context.getHeight(per:0.3),),
                                  //name of unit
                                  Padding(
                                       padding: EdgeInsets.symmetric(horizontal: context.getWidth(per:0.3)),child: 
                                  Text(name, softWrap: true,textAlign: TextAlign.left,style: TextStyle(fontSize: context.getShortest(per:0.41),color: Colors.white), )),
                                  
                                  Spacer(),
                                  Padding(
                                       padding: EdgeInsets.symmetric(horizontal: context.getWidth(per:0.3)),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(start.toString(),style: TextStyle(color: Colors.white)),Text(end.toString(),style: TextStyle(color: Colors.white))],),
                                  ),
                                  Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: context.getWidth(per:0.2)),
                                    child: LinearProgressIndicator(
                                      value: progress,
                                      backgroundColor: AppPalette.whiteColor,
                                      valueColor: AlwaysStoppedAnimation<Color>(AppPalette.whitesky),
                                      minHeight: 5,
                                      borderRadius: BorderRadius.all(Radius.circular(context.getWidth(per: 0.2))),
                                    ),
                                  ),SizedBox(height: context.getHeight(per:0.1))
                                 
                                ],
                              ),
                            ),]
                          ),
                        ],
                      ),
                    );
                  
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
