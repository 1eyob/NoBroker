
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
class User{
  
  String id, name,email,password,address,phone;
var image;
     User(this.name,this.email,this.password,this.address,this.phone,this.image);
    User.withId(this.name,this.email,this.password,this.address, this.phone,this.image);
   Map<String,dynamic> toJson(){
     Map<String,dynamic>  json; 
  json['name'] = this.name;
  json['id'] = this.id;
  json['email']= this.email;
  json['password'] = this.password;
  json['address']= this.address;
  json['phone']= this.phone;
  json['imgage']=this.image;

 return json;
   }

   User.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.password = json['password'];
    this.address = json['address'];
    this.phone = json['phone'];
    this.image = json['image'];
   }

   



}