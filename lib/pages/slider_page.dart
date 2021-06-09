import 'package:flutter/material.dart';

class Sliderpage extends StatefulWidget {
  Sliderpage({Key key}) : super(key: key);

  @override
  _SliderpageState createState() => _SliderpageState();
}

class _SliderpageState extends State<Sliderpage> {
  double _valueSlider = 10.0;
  bool _istrue = false;
  bool _istrueSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _mostrarImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      label: "Tamaño",
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (value) {
        print(value);
        _valueSlider = value;
        setState(() {});
      },
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: Text("Check!"),
      value: _istrue,
      onChanged: (value) {
        _istrue = value;
        setState(() {});
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("switch"),
      value: _istrueSwitch,
      onChanged: (value) {
        _istrueSwitch = value;
        setState(() {});
      },
    );
  }

  Widget _mostrarImagen() {
    return Image(
      image: NetworkImage(
        'https://i.pinimg.com/474x/d3/38/80/d33880db6711db075edfe7c67d675b7b.jpg',
      ),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }
}
