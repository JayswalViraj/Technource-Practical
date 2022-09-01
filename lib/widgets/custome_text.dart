import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomeText extends StatelessWidget {
  String? text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  
   CustomeText({Key? key,this.text,this.color,this.fontSize,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      text.toString(),style: GoogleFonts.rubik( color: color,fontSize:fontSize,fontWeight: fontWeight,),
    );
    
  }
}