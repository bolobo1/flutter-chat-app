import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final imagenRuta;
  final saltoLinea;
  final textoTitulo;
  final tamanoFuente;

  const Logo({
    Key? key,
    required this.imagenRuta,
    required this.saltoLinea,
    required this.textoTitulo,
    required this.tamanoFuente
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: 170,
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(imagenRuta)),
            SizedBox(height: saltoLinea),
            Text(textoTitulo, style: TextStyle(fontSize: tamanoFuente),)
          ],
        ),
      ),
    );
  }
}