import 'package:flutter/material.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/features/registration/registertion_page.dart';

class CourseContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  

   const CourseContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    
  });
 
  @override
  Widget build(BuildContext context) {
    // main container and represent the menu card 
    return InkWell(onTap: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrtionScreen(title: title,source: 'courses',)));   
      },
      child: SizedBox(
        
        width: (context.getWidth(per:4.7)),
        height: (context.getShortest(per:2)),
        child:  
        // main column 
        Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: context.getWidth(per:3.7),),
             Padding(
              padding:  EdgeInsets.only(left:10),
               child: SizedBox(
                 height: context.getShortest(per:4.4) ,
                 width: context.getWidth(per:4.7),
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
                 child: SizedBox(height: context.getShortest(per:0.65),width: context.getWidth(per:4.7) ,child:Text(
                  title,softWrap: true,
                  style:  TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 0, 0),fontSize: context.getShortest(per:0.37)),
                           ),
                 ),
               ),
             
       
           Padding(
             padding:  EdgeInsets.only(left:10),
             child: SizedBox(height: context.getShortest(per:0.6),width: context.getWidth(per:4.7) ,child: Text(
                subtitle,softWrap: true,
                style:  TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: context.getShortest(per:0.34)),
              ) ,),
           )
            //sub title text
            
            
           
             
           
          
           
           
        
        ])),
    );
  }
}