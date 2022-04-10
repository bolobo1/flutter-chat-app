import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatApp'),
      ),
      backgroundColor: Color(0xfffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              ///-> esta linea acomoda todos los elementos
              /// mainAxisAlignment: MainAxisAlignment.spaceBetween 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                const Logo(imagenRuta: 'assets/chat-app-icon-7.jpg', saltoLinea: 20.0, textoTitulo: 'Registro', tamanoFuente: 30.0),
                
                _Form(),

                Labels(ruta: 'login',texto: 'Iniciar Sesion',),

                const Text('Terminos y condiciones de uso', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300),),
                
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      )
    );
  }
}





class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __formState();
}

class __formState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passlCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          
          CustomInput(
            icon: Icons.supervised_user_circle_sharp,
            labelText: 'Nombre',
            hintText: 'Jhon Doe',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),

          CustomInput(
            icon: Icons.mail_outline,
            labelText: 'Email',
            hintText: 'mail@.com',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

          CustomInput(
             icon: Icons.lock_outline,
             labelText: 'Password',
             hintText: '*****',
             textController: passlCtrl,
             isPassword: true,
           ),

          const SizedBox(height: 10),
          _buttonLogin()
        ],
      ),
    );
  }

Widget _buttonLogin(){
    return TextButton(
      style: TextButton.styleFrom(
      elevation: 2,
      backgroundColor: Colors.blue,
      primary: Colors.white,
      shape: StadiumBorder()
      ),
     child: Container(
       width: double.infinity,
       height: 50,
       child: const Center(
         child: Text('Crear Cuenta', style: TextStyle(color: Colors.white, fontSize: 17),)
       ),
     ),
      onPressed: () {
        print(emailCtrl.text +' '+ passlCtrl.text);
       },
     
    );
  }

}

class _Labels extends StatelessWidget {
  const _Labels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Notienes cuenta?',style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10),
          Text('Crea una cuenta!!', style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

Widget _inputTextCorreo(){
  return Container(
           padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(30),
             boxShadow: <BoxShadow>[
               BoxShadow(
                 color: Colors.black.withOpacity(0.05),
                 offset: Offset(0,5)
               )
             ]
           ),
           child: const TextField(
             autocorrect: false,
             keyboardType: TextInputType.emailAddress,
             decoration: InputDecoration(
               prefixIcon: Icon(Icons.mail_outline),
               focusedBorder: InputBorder.none,
               border: InputBorder.none,
               hintText: 'mail@.com',
               labelText: 'Email',
             ),
           ),
  );
}


Widget _inputTextPassword(){
  return Container(
           padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(30),
             boxShadow: <BoxShadow>[
               BoxShadow(
                 color: Colors.black.withOpacity(0.05),
                 offset: Offset(0,5)
               )
             ]
           ),
           child: const TextField(
             autocorrect: false,
             keyboardType: TextInputType.emailAddress,
             decoration: InputDecoration(
               prefixIcon: Icon(Icons.lock),
               focusedBorder: InputBorder.none,
               border: InputBorder.none,
               hintText: '******',
               labelText: 'Password',
             ),
           ),
  );
}




