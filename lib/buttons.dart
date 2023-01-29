import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {


  final color;
  final textcolor;
  final String buttonText;
  final buttonTapped;
  MyButton({this.color,this.textcolor,required this.buttonText,this.buttonTapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Container(
              color: color,
              child:
                Center(child: Text(buttonText,style: TextStyle(color: textcolor,fontWeight: FontWeight.bold,fontSize: 20),)),


            )),
      ),
    );

  }
}
