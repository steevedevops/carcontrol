import 'package:carcontrol/button-simple.dart';
import 'package:carcontrol/model/car.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Car car = new Car(placa: 'IJH2409');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0.0,
        ), 
        preferredSize: Size.zero
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Text('Car Controller',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(left: 33, right: 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Container(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                              height: 50,
                              child: Center(
                                child: Text('${car.marcha}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: car.ligado ? Colors.blue : Colors.grey,
                                    // fontWeight: FontWeight.bold
                                  ),
                                )
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 50,
                              child: Text('MARCHA',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 5, color: Colors.blueAccent)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                              height: 50,
                              child: Center(
                                child: Text('${car.rpm}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: car.ligado ?  car.rpm == 8000 ? Colors.redAccent : Colors.green  : Colors.grey,
                                    // fontWeight: FontWeight.bold
                                  ),
                                )
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 50,
                              child: Text('RPM',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(6.0),
                child: ButtonSimple(
                  text: car.ligado ? 'DESLIGAR' : 'LIGAR',
                  large: true,
                  bgColor: car.ligado ? Colors.green : Colors.grey,
                  color: car.ligado ? Colors.green : Colors.grey,
                  onTap: (){
                    try{
                      car.power();
                      setState(() {});
                    } catch (err) {
                      showDialogmsg(msg: err.toString());
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    ButtonSimple(
                      text: 'ACELERAR',
                      large: false,
                      color: Theme.of(context).primaryColor,
                      onTap: (){
                        try{
                           car.aceleraCar();
                           setState(() {});
                        } catch (err) {
                          showDialogmsg(msg: err.toString());
                        }
                      },
                    ),
                    SizedBox(width: 20),
                    ButtonSimple(
                      text: 'REDUCIR',
                      large: false,
                      color: Colors.lightBlue,
                      onTap: (){
                        try{
                          car.desaceleraCar();
                          setState(() {});
                        } catch (err) {
                          showDialogmsg(msg: err.toString());
                        }
                      },
                    ),
                  ]
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                child: Text('Placa: ${car.placa}',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  Future<String> showDialogmsg({@required String msg}) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
//          title: Text("Alerta"),
          title: Container(
            child: Row(
              children: [
                Icon(Icons.report_problem, color: Colors.orangeAccent,),
                SizedBox(width: 10),
                Text("Ops !"),
              ],
            ),
          ),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }
}