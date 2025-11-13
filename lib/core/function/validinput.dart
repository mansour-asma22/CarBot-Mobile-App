import 'package:get/get.dart';

ValidInput(String val ,int min ,int max ,String type){
  if (type == "username"){
    if(!GetUtils.isUsername(val)){
      return "not valid username";
    }
  }
    if (type == "email"){
    if(!GetUtils.isEmail(val)){
      return "not valid Email";
    }
  }
    if (type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "not valid phone";
    }
  }
   
  if(val.length<min ){
    return "value can't be less than $min";
  }
    if(val.length>max ){
    return "value can't be larger than $max";
  } 
    if(val.isEmpty ){
    return "value can't be Empty";
  }
}