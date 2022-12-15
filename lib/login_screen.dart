import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:untitled7/chat_screen.dart';
import 'package:untitled7/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  String? fullname;
  String? email;
  String? phonenumber;
  String? password;
  LoginScreen({
    this.fullname,
    this.email,
    this.phonenumber,
    this.password,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();


}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(150),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius:BorderRadius.only(
              bottomLeft:Radius.circular(30),
              bottomRight:Radius.circular(30)
            )
          ),
          title: const Text(
            'LOGIIN',
            style: TextStyle(fontSize: 25),

          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
      ),
      body:Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText : 'Enter Your Email',
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'faild is required';
                    }
                  },
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Password'
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'faild is required';
                    }
                  },
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8
                  ),
                  child: const Text('Forget Password?', ),
                ),
              ),
              const SizedBox(height: 15,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blueAccent
                ),
                onPressed: ()  {
                  const SpinKitRotatingCircle(
                    color: Colors.redAccent,
                    size: 50.0,
                  );
                  Provider.of<GoogleProvider>(context,listen: false).googleLogin();

                  },

                icon: const Icon(Icons.lock_open, size: 25,
                color: Colors.amber,
                ),
                label: const Text('Sign In',
                  style: TextStyle(fontSize: 20,
                  ),

                ),

              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Text("Don't have account?" ),
                  Text('Register Now'),
                ],
              )
        ]
        ),
      ),
    ),

    );



  }
}
