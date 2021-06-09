import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _listaNumeros = [];
  bool _isLoading = false;
  int _ultimoItem = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _agregarItems();

    //_scrollController.position.pixels = 700
    //_scrollController.position.maxScrollExtent = 1400
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("https://picsum.photos/500/300/?image=$imagen"),
          );
        },
      ),
    );
  }

  Future<void> _obtenerPagina() {
    final _duration = Duration(milliseconds: 2);
    new Timer(
      _duration,
      () {
        _listaNumeros.clear();
        _ultimoItem++;
        _agregarItems();
      },
    );

    return Future.delayed(_duration);
  }

  void _agregarItems() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    //setState(() {});
  }

  Widget _crearLoading() {
    print(_isLoading);
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> fetchData() async {
    _isLoading = true;
    setState(() {});
    return new Timer(Duration(seconds: 2), responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    setState(() {});
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );

    _agregarItems();
  }
}
