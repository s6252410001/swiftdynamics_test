import 'package:flutter/material.dart';
import 'package:test_swift_dynamics_app/src/pages/create_page.dart';
import 'package:test_swift_dynamics_app/src/pages/list_page.dart';



class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List page = [ListPage(),CreatePage()];
  int selectIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        onTap: (value) {
          setState(() {
            selectIndex = value;
          });
        },

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.black,
        currentIndex: selectIndex,

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 35,
            ),
            label: "List",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_add_alt,
              size: 35,
            ),
            label: 'Create',
          ),




        ],
      ),
      body: page.elementAt(selectIndex),
    );
  }
}
