import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{

  final _textController = TextEditingController();
  final _focusNode = new FocusNode();
  
  List<ChatMessage> _mensajes = [

  ];
  

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              CircleAvatar(
                child: Text('Jo',style: TextStyle(fontSize: 12),),
                backgroundColor: Colors.blue[100],
                maxRadius: 12,
              ),
              SizedBox( height:3 ),
              Text('Jordan Leon', style: TextStyle(color: Colors.black87, fontSize: 12),)
            ],
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: Container(
          child: Column(
            children: [

              Flexible(child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _mensajes.length,
                itemBuilder: (context, i) => _mensajes[i],
                reverse: true,
                )
              ),
              Divider(height: 1,),

              //POR HACER: Caja de texto
              Container(
                color: Colors.white,
                height: 50,
                child: _inputChat(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0 ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted:  _mensajeSubmit,
                onChanged: (String texto){
                    setState(() {
                      if(texto.trim().length > 0){
                        _estaEscribiendo = true;
                      }else{
                        _estaEscribiendo = false;
                      }
                    });
                },
                decoration: InputDecoration.collapsed(hintText: 'Enviar Mensaje'),
                focusNode: _focusNode,
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: 
                Platform.isIOS 
                ?
                CupertinoButton(
                  child: Text('Enviar'),
                  onPressed: _estaEscribiendo
                      ? () => _mensajeSubmit(_textController.text.trim())
                      : null,
                )
                :
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconTheme(
                    data: IconThemeData(
                      color: Colors.blue[400]
                    ),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.send),
                      onPressed: _estaEscribiendo
                      ? () => _mensajeSubmit(_textController.text.trim())
                      : null,
                    ),
                  ),
                )
              
            )
          ],
        ),
      )
    );

    
  }

  _mensajeSubmit(String texto){
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      textoMensaje: texto,
      uid: '123',
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 400)), 
      );
    _mensajes.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    for(ChatMessage message in _mensajes){
      message.animationController.dispose();
    }

    super.dispose();
  }


}



