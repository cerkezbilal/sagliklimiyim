import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:Home() ,
  
  
));


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController kiloController = TextEditingController();
  TextEditingController boyController= TextEditingController();
  String _infoText="Bilgileri Giriniz";

  void bilgileriTemizle(){

    setState(() {
      kiloController.text="";
      boyController.text="";
      _infoText = "Bilgileri Giriniz";
    });


  }

  void hesapla(){

    setState(() {
      double boy =double.parse(boyController.text)/100 ;
      double kilo =double.parse(kiloController.text) ;
      double sonuc = kilo/(boy*boy);

      if(sonuc<18.5){

        _infoText="Normalden çok zayıfsınız (${sonuc.toStringAsPrecision(4)})";
      }else if(sonuc>=18.5 && sonuc<24.9){

        _infoText="Normal Kilolusunuz (${sonuc.toStringAsPrecision(4)})";

      }else if(sonuc>=24.9 && sonuc<29.9){

        _infoText="Fazla Kilolusunuz (${sonuc.toStringAsPrecision(4)})";

      }
      else if(sonuc>=29.9 && sonuc<34.9){

        _infoText="1.Dereceden Obez (${sonuc.toStringAsPrecision(4)})";

      }
      else if(sonuc>=34.9 && sonuc<39.9){

        _infoText="2.Dereceden Obez (${sonuc.toStringAsPrecision(4)})";

      }else if(sonuc>=39.9){

        _infoText="3.Dereceden morbid obez (${sonuc.toStringAsPrecision(4)})";

      }
    });


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kütle Boy Endeksi"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: bilgileriTemizle),
        ],

      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30,right: 15,left: 15),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline,size: MediaQuery.of(context).size.height/6,color: Colors.green,
              ),
              TextField(

                keyboardType: TextInputType.number ,
                decoration: InputDecoration(
                    labelText:"Kilo (kg)",
                    labelStyle: TextStyle(color: Colors.green)

                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green,fontSize: 25.0),
                controller: kiloController,
              ),
              TextField(

                keyboardType: TextInputType.number ,
                decoration: InputDecoration(
                    labelText:"Boy (cm)",
                    labelStyle: TextStyle(color: Colors.green)

                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green,fontSize: 25.0),
                controller: boyController,
              ),

              Container(
                height: 50.0,
                margin: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  onPressed: hesapla,
                  child: Text("Hesapla",style: TextStyle(fontSize: 24.0,color: Colors.white),),
                  color: Colors.green,

                ),
              ),
              SizedBox(height: 10.0,),
              Text(_infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green,fontSize: 20.0),
              ),
            ],
          ),
        )



    );
  }
}


