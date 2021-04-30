import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: IlkPencere(),
  ));
}
class IlkPencere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Hesaplama Alanına Hoşgeldiniz'),
      ),
      body: Center(
        child: ElevatedButton(

          child: Text('Vücut Kitle Endeksi Hesaplama'),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),

            );
          },
        ),
      ),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _Basla createState() => _Basla();

}

class _Basla extends State<Home> {

  TextEditingController kiloKontrol = TextEditingController();
  TextEditingController boyKontrol = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _kitleHesap = "Vücut Bilgilerinizi Girin";

  void _bilgiler() {
    setState(() {
      kiloKontrol.text = "";
      boyKontrol.text = "";

      _kitleHesap = "Vücut Bilgilerinizi Girin";
    });
  }

  void _kitleHesapla() {
    setState(() {
      double kilo = double.parse(kiloKontrol.text);
      double uzunluk = double.parse(boyKontrol.text) / 100;

      double indeks = kilo / (uzunluk * uzunluk);

      print(indeks);
      if (indeks < 18.6) {
        _kitleHesap = "Ağırlık Altında \n(Indeksiniz: ${indeks.toStringAsPrecision(3)})";
      } else if (indeks >= 18.6 && indeks < 24.9) {
        _kitleHesap = "İdeal Ağırlık \n(Indeksizniz: ${indeks.toStringAsPrecision(3)})";
      } else if (indeks >= 24.9 && indeks < 29.9) {
        _kitleHesap =
        "Hafif Kilolu \n(Indeksiniz: ${indeks.toStringAsPrecision(3)})";
      } else if (indeks >= 29.9 && indeks < 34.9) {
        _kitleHesap =
        "1. Derece Obezite \n(Indeksiniz: ${indeks.toStringAsPrecision(3)})";
      } else if (indeks >= 34.9 && indeks < 39.9) {
        _kitleHesap =
        "2. Derece Obezite \n(Indeksiniz: ${indeks.toStringAsPrecision(3)})";
      } else if (indeks >= 40) {
        _kitleHesap =
        "3. Derece Obezite \n(Indeksiniz: ${indeks.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  // TODO: implement widget
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            title: Text("Vücut Kitle İndeksi Hesaplama"),
            centerTitle: true,
            backgroundColor: Colors.cyan,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.refresh),
                onPressed: _bilgiler,)
            ]
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person, size: 200.0, color: Colors.cyan,),
                TextFormField(keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Kilonuz (Kg)",
                    labelStyle: TextStyle(color: Colors.teal),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.teal[900], fontSize: 25.0),
                  controller: kiloKontrol,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Lütfen Kilonuzu Giriniz";
                    }
                    return null;
                  },
                ),
                TextFormField(keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Boyunuz (Cm)",
                    labelStyle: TextStyle(color: Colors.teal),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.teal[900], fontSize: 25.0),
                  controller: boyKontrol,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Lütfen Boyunuzu Giriniz";
                    }
                    return null;
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  height: 80.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _kitleHesapla();
                      }
                    },
                    child: Text("Hesapla", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    color: Colors.cyan,
                  ),
                ),
                Text( _kitleHesap,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.cyan, fontSize: 25.0),
                )
              ],
            ),
          ),
        )
    );
  }
}