import 'package:flutter/material.dart';
import 'package:flutter_componentes/providers/menu_provider.dart';
import 'package:flutter_componentes/utils/icons_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarDatos(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _listaItem(snapshot.data, context),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
    List<Widget> opciones = [];

    data.forEach(
      (item) {
        opciones.add(
          Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, item["ruta"]);
                },
                title: Text(item["texto"]),
                leading: getIcon(item["icon"]),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                ),
              ),
              Divider(),
            ],
          ),
        );
      },
    );

    return opciones;
  }
}
