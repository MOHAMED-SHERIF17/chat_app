import 'package:flutter/material.dart';
import 'package:untitled7/login_screen.dart';

class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius:BorderRadius.only(
                  bottomLeft:Radius.circular(30),
                  bottomRight:Radius.circular(30)
              )
          ),
          title: const Text(
              'REGISTER',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
      ),
    body: Padding(
    padding: const EdgeInsets.all(30),
    child: Column(
    children: [
         Padding(
           padding: const EdgeInsets.all(10),
           child: TextFormField(
    controller: fullnameController,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person),

    hintText: 'FullName'
    ),
             validator: (value){
               if(value!.isEmpty){
                 return 'faild is required';
               }
             },
    ),
         ),
    const SizedBox(height: 10),
    Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email),
      hintText: 'Email'
      ),
        validator: (value){
          if(value!.isEmpty){
            return 'faild is required';
          }
        },
      ),
    ),
    const SizedBox(height: 10),
    Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
      controller: phonenameController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.phone),
      hintText: 'PhoneNumber'
      ),
        validator: (value){
          if(value!.isEmpty){
            return 'faild is required';
          }
        },
      ),
    ),
    const SizedBox(height: 10),
    Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
      controller: passwordController,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.key),
      labelText: 'Password'
      ),
        validator: (value){
          if(value!.isEmpty){
            return 'faild is required';
          }
        },
      ),
    ),
    const SizedBox(height: 10),
     Padding(
       padding: const EdgeInsets.all(15),
       child: ElevatedButton(
           onPressed:(){
             print(
                 'FullName: ${fullnameController.text}-Email: ${emailController.text}-PhoneNumber: ${phonenameController.text}-Password:${passwordController.text}');

             Navigator.push(context,
             MaterialPageRoute(builder: (context) =>LoginScreen(
               fullname: fullnameController.text,
               email: emailController.text,
               phonenumber: phonenameController.text,
               password: passwordController.text,
             )
             )
             );

           } ,
           style: ElevatedButton.styleFrom(
               backgroundColor: Colors.deepPurpleAccent,
               padding: const EdgeInsets.symmetric(horizontal: 65,vertical: 18),
               textStyle: const TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.bold
               )
           ),
           child: const Text('Sign Up')
       ),
     )

    ]
    )
    )
    );
  }
}
