import 'package:carcontrol/model/car-exception.dart';
import 'package:flutter/material.dart';

class Car extends ChangeNotifier{
  String placa;
  bool ligado;
  int rpm;
  String marcha;
  int countMarcha = 0;
  
  Car({@required this.placa, this.ligado=false, this.rpm=0, this.marcha="P"});

  void power(){
    if(ligado && marcha == "P" && rpm == 1000){
      ligado = false;
      rpm = 0;
      // throw new CarException("O carro ja esta ligado");
    }else if(!ligado){
      ligado = true;
      rpm = 1000;
      print(placa);
    }else{
      throw new CarException("Precisa baixar a velocidade");
    }
  }

  void aceleraCar(){
    if(ligado){
      if(rpm < 8000){
        rpm = rpm + 1000;
        if(rpm > 4000 && marcha != "6"){
          rpm = 2000;
          countMarcha = countMarcha + 1;
          marcha = countMarcha > 0 ? "${countMarcha.toString()}" : "P";
        }
      }else{
        throw new CarException("Cuidado voce pasou dos limites de rmp o maximo e 8000");
      }
    }else{
       throw new CarException("O carro esta desligado");
    }
  }

  void desaceleraCar(){
    if(ligado){
      if(rpm > 1000 && marcha != "P"){
        rpm = rpm - 1000;

        if(rpm == 2000 && marcha != "1"){
          countMarcha = countMarcha - 1;
          rpm = 4000;
          marcha = countMarcha > 0 ? "${countMarcha.toString()}" : "P";
        }
      }else{
        rpm = 1000;
        marcha = "P";
      }
    }else{
      throw new CarException("O carro esta desligado");
    }
  }
}