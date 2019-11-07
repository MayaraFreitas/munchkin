import 'dart:math';
import 'package:flutter/material.dart';

var dadoValor = new Random();
int valor = 0;

int lancarDado() {
  valor = dadoValor.nextInt(7);
  
  return valor;
}

String getDadoValor(){
  do{
    valor = lancarDado();
  }while(valor == 0);
  
  return valor.toString();
}


  Color randomColor(){
    var randomColorValue = new Random();
    var value = randomColorValue.nextInt(6);
    print(value);
    if(value == 0){
      return Color(0xff6F74FF);
    }if(value == 1){
      return Color(0xffFF7E55);
    }if(value == 2){
      return Color(0xffD156BD);
    }if(value == 3){
      return Color(0xff2DBDB6);
    }if(value == 4){
      return Color(0xff5CA5E0);
    }if(value == 5) {
      return Color(0xffFF5746);
    }
    
  }