import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String ruta;
  final String texto;

  Labels({Key? key, required this.ruta, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Text(texto, style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold
                ),
              ),
            onTap: (){
              print('tap');
              Navigator.pushReplacementNamed(context, this.ruta);
            },
            )
        ],
      ),
    );
  }
}