import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nobroket/constants/constants.dart';
import 'package:nobroket/model/user.dart';
import 'package:nobroket/ui/widgets/custom_shape.dart';
import 'package:nobroket/ui/widgets/responsive_ui.dart';
import 'package:nobroket/ui/widgets/textformfield.dart';
import 'package:http/http.dart' as http;
import 'package:nobroket/global.dart';
import 'package:path/path.dart' as prefix0;
import 'dart:typed_data';




class UserAccount extends StatelessWidget {
   User user;
   UserAccount(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _UserAccount(this.user),
    );
  }
}

class _UserAccount extends StatefulWidget {
  User user;
  _UserAccount(this.user);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserAccountState(this.user);
  }

}
 class _UserAccountState extends State<_UserAccount> {
    User user;
    _UserAccountState(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){},

        backgroundColor: Colors.blue,
        
      ),
      body: SafeArea(
        child:ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 330,
                  color: Colors.orange,
                ),
                Positioned(
                  top: 10,
                  right: 30,
                  child: Icon(Icons.settings,color: Colors.white,),
                  ),
                  Column(
                    children: <Widget>[
                      Container(

                        height: 90,
                        margin: EdgeInsets.only(top: 60),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Image.memory(user.image),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                      Text(user.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                         ),
                         textAlign: TextAlign.center,
                      
                      ),
                      Padding(padding: EdgeInsets.all(4),),
                       Container(
                         padding: EdgeInsets.all(10),
                         margin: EdgeInsets.only(top:20),
                         child: Card(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: <Widget>[
                               Column(
                                 children: <Widget>[
                                   Container(
                                     padding: EdgeInsets.only(bottom:5,top: 15),
                                     child: Text("Posts" ,
                                     style: TextStyle(color: Colors.black54),),

                                   ),
                                   Container(
                                     padding: EdgeInsets.only(bottom:5),
                                     child: Text("30" ,
                                     style: TextStyle(color: Colors.black87,fontSize: 16),),

                                   )
                                 ],
                               ),
                               Column(
                                 children: <Widget>[
                                   Container(
                                     padding: EdgeInsets.only(bottom:5,top: 15),
                                     child: Text("Followers" ,
                                     style: TextStyle(color: Colors.black54),),

                                   ),
                                   Container(
                                     padding: EdgeInsets.only(bottom:5),
                                     child: Text("100" ,
                                     style: TextStyle(color: Colors.black87,fontSize: 16),),

                                   )
                                 ],
                               ),
                               Column(
                                 children: <Widget>[
                                   Container(
                                     padding: EdgeInsets.only(bottom:5,top: 15),
                                     child: Text("Followings" ,
                                     style: TextStyle(color: Colors.black54),),

                                   ),
                                   Container(
                                     padding: EdgeInsets.only(bottom:5),
                                     child: Text("25" ,
                                     style: TextStyle(color: Colors.black87,fontSize: 16),),

                                   )
                                 ],
                               ),
                             ],
                           ),
                         ),
                       )


                    ],
                  )
              ],
            ),
            Container(
               padding: EdgeInsets.all(10),
               child: Column(
                 children: <Widget>[
                   Card(
                     child: Container(
                       alignment: Alignment.topLeft,
                       padding: EdgeInsets.all(15),
                       child:Column(
                        children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("User information",
                       style: TextStyle(
                         color: Colors.black87,
                         fontWeight: FontWeight.w500,
                         fontSize: 16,
                       ),
                       textAlign: TextAlign.left,
                       ),
                      ),
Divider(color: Colors.black38,),
                   Container(
                     child: Column(
                       children: <Widget>[
                         ListTile(
                           contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                           leading: Icon(Icons.my_location),
                           title: Text("Location"),
                           subtitle: Text(user.address != null ?user.address:" " ),
                         ),
                         ListTile(
                       leading:Icon(Icons.email) ,
                       title: Text("Email"),
                       subtitle: Text(user.email!= null ?user.email:" " ),

                         ),
                          ListTile(
                       leading:Icon(Icons.phone  ) ,
                       title: Text("Phone"),
                       subtitle: Text(user.phone!= null ?user.phone:" " ) ,
                       
                         )

                       ],
                     ),
                   ),
                        ],
                       ),
                       

                     ),
                     
                   ),
                   

                 ],
               ),
            )
          ],
        ) ,),
    );
  }

    }
    

// class _UserAccountState extends State<_UserAccount> {
//     User user;
//     _UserAccountState(this.user);
//    Map<String , dynamic> params;
//   double _height;
//   double _width;
//   double _pixelRatio;
//   bool _large;
//   bool _medium;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   GlobalKey<FormState> _key = GlobalKey();



//   @override
//   Widget build(BuildContext context) {
//      _height = MediaQuery.of(context).size.height;
//      _width = MediaQuery.of(context).size.width;
//      _pixelRatio = MediaQuery.of(context).devicePixelRatio;
//      _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
//      _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
//     return Material(
//       child: Container(
//         height: _height,
//         width: _width,
//         padding: EdgeInsets.only(bottom: 5),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               clipShape(),
//               name(),
//               email(),
//               phone(),
             
             
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget clipShape() {
//     //double height = MediaQuery.of(context).size.height;
//     return Stack(
//       children: <Widget>[
//         Opacity(
//           opacity: 0.75,
//           child: ClipPath(
//             clipper: CustomShapeClipper(),
//             child: Container(
//               height:_large? _height/4 : (_medium? _height/3.75 : _height/3.5),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.orange[200], Colors.orangeAccent],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Opacity(
//           opacity: 0.5,
//           child: ClipPath(
//             clipper: CustomShapeClipper2(),
//             child: Container(
//               height: _large? _height/4.5 : (_medium? _height/4.25 : _height/4),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.orange[200], Colors.orangeAccent],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.bottomCenter,
//           margin: EdgeInsets.only(top: _large? _height/30 : (_medium? _height/25 : _height/20)),
//           child: Image.memory(user.image,
//             height: _height/3.5,
//             width: _width/3.5,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget welcomeTextRow() {
//     return Container(
//       margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
//       child: Row(
//         children: <Widget>[
//           Text(
//             "Welcome",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: _large? 60 : (_medium? 50 : 40),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// Widget name(){
//   return Container(
//     margin: EdgeInsets.only(
//           left: _width / 12.0,
//           right: _width / 12.0,
//           top: _height / 15.0),
//         child: Card(
//           elevation: 20.0,
//      child: ListTile(
//           title: Text(user.name), onTap: (){ 
//             print(user.name + "is preesed");
//           },
//           subtitle: Text("Name"),
//           trailing: IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: (){
//       print("Icon is pressed");
//             },) ,
          
//           )
          
//         )
        
        
//           );
  
// }
// Widget email(){
//   return Container(
//     margin: EdgeInsets.only(
//           left: _width / 12.0,
//           right: _width / 12.0,),
       
//         child: Card(
//           elevation: 20.0,
//      child: ListTile(
//           title: Text(user.email), onTap: (){ 
//             print(user.email + " is preesed");
//           },
//           subtitle: Text("Email"),
//           trailing: IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: (){
//       print("Icon is pressed");
//             },) ,
          
//           )
          
//         )
        
        
//           );
  
// }
// Widget phone(){
//   return Container(
//     margin: EdgeInsets.only(
//           left: _width / 12.0,
//           right: _width / 12.0,),
       
//         child: Card(
//           elevation: 20.0,
//      child: ListTile(
//           title: Text(user.phone!=null?user.phone:" no number" ), onTap: (){ 
//             print(user.email + " is preesed");
//           },
//           subtitle: Text("Phone"),
//           trailing: IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: (){
//       print("Icon is pressed");
//             },) ,
          
//           )
          
//         )
        
        
//           );
  
// }
// Widget signInTextRow() {
//     return Container(
//       margin: EdgeInsets.only(left: _width / 15.0),
//       child: Row(
//         children: <Widget>[
//           Text(
//             "Sign in to your account",
//             style: TextStyle(
//               fontWeight: FontWeight.w200,
//               fontSize: _large? 20 : (_medium? 17.5 : 15),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }
