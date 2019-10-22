import 'dart:math';

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

