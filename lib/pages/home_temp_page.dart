import 'package:flutter/material.dart';

class HomeTempPage extends StatefulWidget {
  const HomeTempPage({Key key}) : super(key: key);

  @override
  _HomeTempPageState createState() => _HomeTempPageState();
}

class _HomeTempPageState extends State<HomeTempPage> {
  TextEditingController _inputFieldDateController = new TextEditingController();
  String _fecha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: 40.0),
        child: ListView(
          //scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onLongPress: () {
                print('object');
                PopupMenuButton(
                  offset: Offset(0, 50), //add offset to fix it
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text('item'),
                        value: 'item',
                      )
                    ];
                  },
                );
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text('data'),
              ),
            ),
            _crearFecha(context),
            ListTile(
              onTap: () {
                print('Click!!!');
              },
              title: Text("Gustavo"),
              subtitle: Text('Instructor de Flutter'),
              leading: CircleAvatar(),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                print('Click!!!');
              },
              title: Text("Gustavo"),
              subtitle: Text('Instructor de Flutter'),
              leading: CircleAvatar(),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
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
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
