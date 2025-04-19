import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function pressedFunc;
  CustomButton({required this.text,required this.pressedFunc});
  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: ()=>pressedFunc(),
          child: Text(text),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(34, 255, 255, 255)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(const Color.fromARGB(22, 255, 255, 255)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            )
          ),
        );
  }
}

class TodoBox extends StatelessWidget {
  final String text;
  TodoBox({required this.text});
  @override

  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width : 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(6, 255, 255, 255),
            const Color.fromARGB(19, 255, 255, 255)
            ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        )
      ),
     child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [ 
        CustomButton(text: "DO",pressedFunc: () => {}),
        Text(
            text,
            style: TextStyle(
            color: Colors.white,
            fontSize: 20 
            ),
        )
      ]
      )
    );
  }
}

class AddBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      color : const Color.fromARGB(134, 255, 255, 255)
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Widget> todo = []; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(213, 0, 0, 0),
          title: Text(
            "TODO LIST",
            style: TextStyle(
            color: Colors.white,
            fontSize: 20 
            ),
        ),
          actions: [
            CustomButton(
              text: "ADD",pressedFunc: () => setState(() {
                todo.add(TodoBox(text: "Hi"));
              }
              ),
            ),
            SizedBox(
              width: 50,
            ),

            CustomButton(
              text: "REMOVE",pressedFunc: () => setState(() {
                if (!todo.isEmpty) {
                  todo.removeLast();
                }
              }
              ),
            ),
          ],
        ),
        body:
         Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black,Color.fromARGB(242, 24, 24, 24)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft
            )
          ),
          child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: todo
            ),
          )
          )
        ),
      ),
    );
  }
}
