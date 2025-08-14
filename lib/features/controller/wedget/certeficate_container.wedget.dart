import 'package:coursa/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';

import 'package:coursa/features/registration/registertion_page.dart';

class CerteficateContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  

   const CerteficateContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    
  });
 
  @override
  Widget build(BuildContext context) {
    // main container and represent the menu card 
    return InkWell(onTap: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrtionScreen(title: title,source:'Certeficates')));   
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.05)),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: AppPalette.black),borderRadius: BorderRadius.all(Radius.circular(context.getShortest(per: 1)))),
          width: (context.getWidth(per:4.4)),
          height: (context.getShortest(per:3.5)),
          child:  
          // main column 
          Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: context.getWidth(per:4.4),),
               Padding(
                padding:  EdgeInsets.only(left:10,top: 10),
                 child: SizedBox(
                   height: context.getShortest(per:4.1) ,
                   width: context.getWidth(per:4.4),
                   child: ClipRRect(
                     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                     child: Image.asset(
                       imagePath,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
               ),
        
              
            
              // the title text
           
                 Padding(
                   padding:  EdgeInsets.only(left:10),
                   child: SizedBox(height: context.getShortest(per:0.5),width: context.getWidth(per:4.3) ,child:Text(
                    title,softWrap: true,
                    style:  TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 0, 0),fontSize: context.getShortest(per:0.37)),
                             ),
                   ),
                 ),
               
         
             Padding(
               padding:  EdgeInsets.only(left:10),
               child: SizedBox(height: context.getShortest(per:0.4),width: context.getWidth(per:4.4) ,child: Text(
                  subtitle,softWrap: true,
                  style:  TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: context.getShortest(per:0.34)),
                ) ,),
             )
              //sub title text
              
              
             
               
             
            
             
             
          
          ])),
      ),
    );
  }
}