
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
class Item{
  
  String id, name,type,description,user_id,user_name,user_phone,user_address;

var image;
     Item(this.id,this.name,this.type,this.description,this.image,this.user_id,this.user_name,this.user_address,this.user_phone);
    
   Map<String,dynamic> toJson(){
     Map<String,dynamic>  json; 
  json['name'] = this.name;
  json['_id'] = this.id;
  json['type']= this.type;
  json['description'] = this.description;
  json['imgage']=this.image;
  json['user']['_id']= this.user_id;
  json['user']['name'] = this.user_name;
  json['user']['address'] = this.user_address;
  json['user']['phone'] = this.user_address;

  

 return json;
   }

   Item.fromJson(Map<String,dynamic> json){
    this.id = json['_id'];
    this.name = json['name'];
    this.type = json['email'];
    this.description = json['password'];
    this.image = json['image'];
    this.user_id = json['user']['_id'];
    this.user_name = json['user']['name'];
    this.user_address = json['user']['address'];
    this.user_phone = json['user']['phone'];
   }

   



}