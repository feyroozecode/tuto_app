
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  int _selected = 0;

  updateIndex(int selectedItem){
    setState(() {
      _selected = selectedItem;
    });
  }

  updateAppTitle(int index){
    if(index == 0){
      return "Accuel";
    } else if(index == 1){
      return "Recherche";
    } else if(index ==2 ){
      return "Favoris";
    } else if(index ==3){
      return "Profile";
    } else {
      return "Ahlan Wa sahlan";
    }
  }

  bool showModal = false;
  late PersistentBottomSheetController? _bottomSheetController;

  @override
  Widget build(BuildContext context) {

    /*
    _showOrHideBM(BuildContext context, String name, show){

    showModal = show;
    if(showModal) {
      _bottomSheetController = _scaffoldKey.currentState!.showBottomSheet(
      (_) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Center(
          child: Text("Je vient du bas de votre ecra, bonjour $name", style: const TextStyle(
            fontSize: 18.0, color: Colors.orange
          ),),
        ),
      ));
    } 
    else {
      if(_bottomSheetController != null) {
        _bottomSheetController!.close();
        _bottomSheetController = null;
      }
    }
    }
  */

    return Scaffold(
      key: _scaffoldKey,
      ///ENTETE DE LA PAGE ACCUEIL
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, 
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.orange,
        title:  Text(updateAppTitle(_selected)), 
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, icon: Icon(Icons.more_horiz)), 

          IconButton(onPressed: () {
          }, icon: Icon(Icons.info_outline))  
        ],
      ),

      /// CONTENU DE LA PAGE ACCUEIL 
      body: Container(
        color: Color.fromARGB(255, 236, 236, 236),
        child: Center(
          child:  Text("Assalam Aleykoum $selectedName", style: 
          const TextStyle(
            fontSize: 18.0, color: Colors.orange
          ),),
        )
      ),

      // BUTTON FLOTTENT
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: (){
          updateName(getRandomElement(names));
                      //showBottomSheet(context, this.selectedName);
          
        },
        child: const Icon(Icons.explore),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        elevation: 5.0,
        onTap: updateIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.orange, size: 34.0,), label: "Accueil", backgroundColor: Colors.grey),
          BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.orange, size: 34.0,), label: "Recherche"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.orange, size: 34.0,), label: "Favoris"),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.orange, size: 34.0,), label: "Profile")
        ],
      ),

    );

    
  }
  
}