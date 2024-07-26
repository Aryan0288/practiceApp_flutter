// import 'dart:ffi';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practiceapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //  this is login page
  String name="";
  bool status=false;
  bool failed=false;
  String username="";
  final _formKey=GlobalKey<FormState>();

  submitHandler(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      setState(() {
        status=true;
      });
      print(_formKey.currentState!.validate());
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        status=false;
      });
    }else{
        print("button clicked form button");
        print(_formKey.currentState!.validate());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child:SingleChildScrollView(// Optional
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
             
             Text(
               "Welcome, Hi $name ",
                style:const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrangeAccent,
                ),
             ),
        
            const SizedBox(
              height: 20,
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
        
                    decoration:  InputDecoration(
                        hintText: "Enter Your Name",
                        labelText:failed? " $name": "UserName"
                    ),
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return "UserName is required";
                      }
                      return null;
                    },
                    onChanged: (value){
                      name=value;
                      status=false;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration:const  InputDecoration(
                        hintText: "Enter Your Password",
                        labelText: "Password",
                    ),
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return "Password is required";
                      }
                      if(value.length<6){
                        return "Password length should be 6";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: status? Colors.green: Colors.deepOrange,
                    borderRadius:BorderRadius.circular(25),
                    child: InkWell(
                      onTap: ()=> submitHandler(context),
                      child: AnimatedContainer(
                        duration:const Duration(seconds: 1),
                        width: status? 50:140,
                        height:status?50:45,
                        alignment: Alignment.center,
                       child:status? const Icon(Icons.done) : const Text("Sign In",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );


    // return Material(
    //   color: Colors.white,
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Image.asset(
    //           "assets/images/login_image.png",
    //           fit: BoxFit.cover,
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         const Text(
    //           "Welcome, Hi",
    //           style: TextStyle(
    //             fontSize: 24,
    //             fontWeight: FontWeight.w600,
    //             color: Colors.deepOrange,
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    //           child: Column(
    //             children: [
    //               TextFormField(
    //                 decoration: const InputDecoration(
    //                   hintText: "Enter Your Name",
    //                   labelText: "UserName",
    //                 ),
    //               ),
    //               TextFormField(
    //                 obscureText: true,
    //                 decoration: const InputDecoration(
    //                   hintText: "Enter Your Password",
    //                   labelText: "Password",
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   print("button clicked");
    //                 },
    //                 child: const Text("Sign In"),
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: Colors.yellow,
    //                   foregroundColor: Colors.red,
    //                   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    //                   textStyle: const TextStyle(
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

  }
}
