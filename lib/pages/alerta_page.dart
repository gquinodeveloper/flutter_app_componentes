import 'package:flutter/material.dart';

class AlertaPage extends StatelessWidget {
  const AlertaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerta'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _mostrarAlerta(context),
          child: Text("Mostrar Alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text('Cabecera'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('To round the corners of a rectangular shape'),
              FlutterLogo(size: 100.0),
            ],
          ),
          actions: [
            /* InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ), */
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
            /* FlatButton(
              onPressed: () => 
              child: Text("Cancelar"),
            ), */
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
            /* FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ), */
          ],
        );
      },
    );
  }
}
