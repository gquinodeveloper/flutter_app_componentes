import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> numero = [1, 2, 3, 4];

    return Scaffold(
      //backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: ListView(
          children: [
            _cardTipo1(),
            SizedBox(height: 20.0),
            _cardTipo2(),
            SizedBox(height: 20.0),
            _cardTipo1(),
            SizedBox(height: 20.0),
            _cardTipo2(),
            SizedBox(height: 20.0),
            _cardTipo1(),
            SizedBox(height: 20.0),
            _cardTipo2(),
            SizedBox(height: 20.0),
            _cardTipo1(),
            SizedBox(height: 20.0),
            _cardTipo2(),
            SizedBox(height: 20.0),
            _cardTipo1(),
            SizedBox(height: 20.0),
            _cardTipo2(),
          ],
        ),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("Cabecera de card"),
            subtitle: Text('To round the corners of a rectangular shape'),
            leading: Icon(
              Icons.photo_album,
              color: Colors.green,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: null,
                child: Text("Cancelar"),
              ),
              TextButton(
                onPressed: null,
                child: Text("Ok"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              /* Image(
                image: NetworkImage(
                  'https://i.pinimg.com/474x/58/7c/e4/587ce440682f6658a50f7508e6e4d6c8.jpg',
                ),
              ), */
              FadeInImage(
                image: NetworkImage(
                  'https://i.pinimg.com/474x/58/7c/e4/587ce440682f6658a50f7508e6e4d6c8.jpg',
                ),
                placeholder: AssetImage('assets/jar-loading.gif'),
                fadeInDuration: Duration(milliseconds: 600),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'To round the corners of a rectangular shape, use the borderRadius property of a BoxDecoration object. Create a new BorderRadius object that specifies the radius for rounding each corner.',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
