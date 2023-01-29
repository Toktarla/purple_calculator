import 'package:flutter/material.dart';
import 'package:untitled1/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userQuestion='';
  var userAlter='';
  void equalPressed()
  {
    String finalQuestion=userQuestion;
    finalQuestion=finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAlter=eval.toString();

  }

  final List<String> buttons=[
    'C','DEL','%','/',
    '9','8','7','x',
    '6','5','4','-',
    '3','2','1','+',
    '0','.','^','='

  ];
  bool isOperator(String x)
  {
    if(x=='%' || x=='/' || x=='x' || x=='-' || x=='+' ||x=='=' ||x=='^')
    {
      return true;

    }
    return false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
     body: Column(

       children: [
         Expanded(
          flex: 2,
           child: Container(

             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 SizedBox(height: 75,),
                Container(child: Text(userQuestion,style: TextStyle(fontSize: 30,color: Colors.white),),
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                ),
                 Container(child: Text(userAlter,style: TextStyle(fontSize: 30,color: Colors.grey[600]),),
                   padding: EdgeInsets.all(20),
                   alignment:Alignment.centerRight,

                 ),

                 Row(
                   children: [
                     IconButton(
                       color: Colors.cyan[300],
                       icon: Icon(Icons.maximize_rounded),
                       onPressed: (){
                         setState(() {
                           userQuestion=userQuestion.substring(0,userQuestion.length-1);
                         });


                       },

                     ),
                     IconButton(
                       color: Colors.cyan[300],
                       icon: Icon(Icons.calculate_outlined),
                       onPressed: (){
                         setState(() {
                           userQuestion=userQuestion.substring(0,userQuestion.length-1);
                         });


                       },

                     ),
                     IconButton(
                       color: Colors.cyan[300],
                       icon: Icon(Icons.access_time_rounded),
                       onPressed: (){
                         setState(() {
                           userQuestion=userQuestion.substring(0,userQuestion.length-1);
                         });


                       },

                     ),
                       SizedBox(width: 200,),
                       IconButton(
                         color: Colors.grey[800],
                         icon: Icon(Icons.delete_forever_rounded),
                         onPressed: (){
                           setState(() {
                             userQuestion=userQuestion.substring(0,userQuestion.length-1);
                           });


                         },

                       ),

                   ],
                 ),




               ],

             ),



           ),
         ),
         Expanded(
           flex: 3,

           child: Container(
             height: 350,
             width: 350,
             child: GridView.builder(
               itemCount: buttons.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
               itemBuilder: (BuildContext context,int index){



                 if(index==0) {

                   return MyButton(buttonTapped: (){
                        setState(() {
                          userQuestion='';
                          userAlter='';

                        });
                   },color: Colors.deepPurple[50],textcolor: Colors.red,buttonText: buttons[index],);
                 }
                 else if(index==1){
                   return MyButton(buttonTapped: (){
                     setState(() {
                       userQuestion=userQuestion.substring(0,userQuestion.length-1);

                     });
                   },color: Colors.redAccent,textcolor: Colors.white,buttonText: buttons[index],);
                 }

                 else if(index==buttons.length-1){
                   return MyButton(buttonTapped: (){
                     setState(() {
                       equalPressed();

                     });
                   },color: Colors.deepPurple,textcolor: Colors.white,buttonText: buttons[index],);
                 }
                 else{
                   return MyButton(buttonTapped: (){
                     setState(() {
                       userQuestion+=buttons[index];
                     });
                   },buttonText: buttons[index],color: isOperator(buttons[index]) ? Colors.deepPurple :Colors.deepPurple[50],textcolor: isOperator(buttons[index]) ? Colors.white :Colors.deepPurple);

                 }

               },

             ),

           ),
         ),
       ],
     ),
    );

  }

}
