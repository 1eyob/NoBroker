import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nobroket/constants/constants.dart';
import 'package:nobroket/model/user.dart';
import 'package:nobroket/ui/Item/homeItems.dart';
import 'package:nobroket/ui/user/useraccount.dart';
import 'package:nobroket/ui/widgets/custom_shape.dart';
import 'package:nobroket/ui/widgets/responsive_ui.dart';
import 'package:nobroket/ui/widgets/textformfield.dart';
import 'package:http/http.dart' as http;
import 'package:nobroket/global.dart';


class Home extends StatelessWidget {
  User user;
  Home(this.user);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(this.user),
    );
  }
}

class HomeScreen extends StatefulWidget {
  User user;
  HomeScreen(this.user);
  @override
  _HomeScreenState createState() => _HomeScreenState(this.user);
}

class _HomeScreenState extends State<HomeScreen> {
  
  User user;
  _HomeScreenState(this.user);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        backgroundColor: Colors.orange.shade200,
       
        actions: <Widget>[
      Container(
        
        width: 150.0,
          height: 0.1,
          child:Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
child:     CustomTextField(
      keyboardType: TextInputType.emailAddress,
     // textEditingController: emailController,
      icon: Icons.search,
      hint: "Search item",
    ),
      ),
          ),

        IconButton(
          
          icon:Icon(Icons.search) ,
          onPressed: (){
            print("search icon button is pressed");
          },
          )
        ],

      ),
         drawer: Drawer(
            
            child: SafeArea(
              
              child: ListView(
                children: <Widget>[
                  
                  // UserAccountsDrawerHeader(
                  //   decoration: BoxDecoration(
                  
                    
                  //   gradient: LinearGradient(
                  //     colors: [Colors.orange.shade100,Colors.orange.shade200, Colors.orange.shade500,]
                  //   )
                  //   ),
                  //   accountName:Text( user.name),
                  //   accountEmail: Text(user.email),
                  //     currentAccountPicture:GestureDetector(
                  //     child: CircleAvatar(
                  //       child: user.image!=null? CircleAvatar(
                  //         child: Image.memory(user.image)
                           
                          
                  //         ):Icon(Icons.person,size: 70.0,)

                  //     ),
                  //   ) ,),
                  Container(
                   child: Stack(
                     children: <Widget>[
                    Container(
                      child:user.image != null?
                      Image.memory(user.image):Icon(Icons.person)
                    ),
                     ],
                   ),
                  ),
InkWell(
  onTap: (){},
  child: ListTile(
    leading:Icon(Icons.home),
    title: Text("Home"),
  ),
),
InkWell(
  onTap: (){},
  child: ListTile(
    leading:Icon(Icons.person),
    title: Text("My account"),
     onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>UserAccount(this.user)));
    },
  ),
),
InkWell(
  onTap: (){},
  child: ListTile(
    leading:Icon(Icons.shopping_basket),
    title: Text("My orders"),
  ),
),
InkWell(
  onTap: (){},
  child: ListTile(
    leading:Icon(Icons.dashboard),
    title: Text("Catagories"),
  ),
  
),
InkWell(
  onTap: (){},
  child: ListTile(
    leading:Icon(Icons.favorite),
    title: Text("Favourites"),
  ),
  
),
InkWell(
  onTap: (){},
  child: ListTile(
    leading:Icon(Icons.settings, color: Colors.blue,),
    title: Text("Setting"),
   
  ),
  
),
InkWell(
  onTap: (){},
  child: ListTile(
    leading:Icon(Icons.help, color: Colors.green,),
    title: Text("About"),
  ),
  
),

                ],
              ),
            ),
          ),
          body: HomeItems(user),
    );
  }

 
}