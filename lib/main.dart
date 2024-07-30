import 'package:bmi_calculator/intro_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: introPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text('BMI Calculator', style:
        TextStyle(
            fontWeight: FontWeight.bold,color: Colors.black),)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 34 ),),

                SizedBox(height: 21,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter Your Weight(in Kgs)'),
                      prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                SizedBox(height: 11,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height(in feet)'),
                        prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                SizedBox(height: 11,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height(in inches)'),
                        prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                SizedBox(height: 16,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){

                    var Wt = wtController.text.toString();
                    var Ft = ftController.text.toString();
                    var Inch = inController.text.toString();

                    if(Wt!="" && Ft!="" && Inch!="")
                    {
                      // bmi calculation

                      var iWt = int.parse(Wt);
                      var iFt = int.parse(Ft);
                      var iInch = int.parse(Inch);

                      var tInch = (iFt*12) + iInch;
                      var tcm = tInch*2.54;
                      var tM = tcm/100;

                      var bmi = iWt/(tM*tM);

                      var msg = "";

                      if(bmi>25)
                      {
                        msg = "You Are Overweight!!";
                        bgColor = Colors.red.shade200;
                      }
                      else if(bmi<18)
                      {
                        msg = "You Are Underweight!!";
                        bgColor = Colors.orange.shade200;
                      }
                      else{
                        msg = "You Are Healthy!!";
                        bgColor = Colors.green.shade400;
                      }
                      setState(() {
                        result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                      });

                    }
                    else
                    {
                      setState(() {
                        result = "Please fill all the blanks!!";
                      });
                    }

                  }, child: Text('Calculate')),
                ),
                 SizedBox(height: 11,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(result,style: TextStyle(fontSize: 21),),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
