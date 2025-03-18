import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          //Today box
          Container(
            height: height * 0.2,
            width: width,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("TODAY",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                    const Text("08:30 am",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 36, 127, 39)))
                  ],
                ),
                const Text("Qatar Auditorium",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)
              ],),
          ),
        ],
      ),
    );
  }
}
