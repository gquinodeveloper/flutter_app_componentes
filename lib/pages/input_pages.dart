import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre;
  String _email;
  String _fecha;

  @override
  Widget build(BuildContext context) {
    print("Estoy dibujando");
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 20.0,
        ),
        child: Column(
          children: [
            _crearInput(),
            SizedBox(height: 10.0),
            _crearInputEmail(),
            SizedBox(height: 10.0),
            _crearPassword(),
            SizedBox(height: 10.0),
            _crearFecha(),
            SizedBox(height: 10.0),
            Text("Nombre: $_fecha"),
          ],
        ),
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: "Ingrese nombre",
        labelText: "Nombre",
        suffixIcon: Icon(Icons.person),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        _nombre = value;
        setState(() {});
      },
    );
  }

  Widget _crearInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Ingre Email",
        labelText: "Email",
        suffixIcon: Icon(Icons.email),
        icon: Icon(Icons.email_outlined),
      ),
      onChanged: (value) {
        _email = value;
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Ingrese Password",
        labelText: "Password",
        suffixIcon: Icon(Icons.vpn_key_sharp),
        icon: Icon(Icons.vpn_key_sharp),
      ),
      onChanged: (value) {},
    );
  }

  Widget _crearFecha() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Ingrese Fecha",
        labelText: "Fecha",
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale("es", "ES"),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
      });
    }
  }
}
