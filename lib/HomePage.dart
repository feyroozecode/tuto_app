
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
}

class _HomePageState extends State<HomePage> {

  List<String> names = [
     "Ibrahim Ahmad", 
     "Hicham Ahmad",
     "Moubarack Issa"
  ];

  var selectedName = "";

  // update name
  updateName(name){
    setState(() {
      selectedName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Mon App'), 
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
        ],
      ),
      body: Container(
        child: Center(
          child:  Text("Assalam Aleykoum $selectedName", style: const TextStyle(
            fontSize: 18.0, color: Colors.green
          ),),
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          updateName(getRandomElement(names));
        },
        child: const Icon(Icons.explore),
      ),
    );
  }
}