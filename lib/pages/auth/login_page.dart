import 'package:flutter/material.dart';
import 'package:odc_formation/pages/auth/signUp_page.dart';
import 'package:odc_formation/pages/home/home.dart';

import '../widget/Button.dart';
import '../widget/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                width: double.infinity,
                height: height/2.7,
                child: Image.asset("assets/images/login.png"),),
              const TextFieldInpute(
                  // textEditingController: ,
                  hintText: "Entrer your email",
                  icon: Icons.email
              ),
              const TextFieldInpute(
                  // textEditingController: ,
                  hintText: "Entrer your password",
                  isPass: true,
                  icon: Icons.lock
              ),
              //we call our forgot password below the login in button
              // const ForgotPassword(),
              Mybutton(
                onTab: (){},
                text: "Connexion",
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1, color: Colors.black54),
                  ),
                  const Text(" ou "),
                  Expanded(
                    child: Container(height: 1, color: Colors.black54),
                  )
                ],
              ),

              // SizedBox(height: height / 25),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.imgbin.com%2F23%2F7%2F2%2Fimgbin-google-logo-google-search-icon-google-google-logo-hEJMjnfCV4MA1gDtjaWTv5kc1.jpg&f=1&nofb=1&ipt=41405f73f63b2021154c49eb700ac03e49de25bcbb217384a134009fa5dcad84&ipo=images",height: 35
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous n’avez pas de compte ? ",style: TextStyle(fontSize: 16),),
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },

                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 16
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
