import 'package:flutter/gestures.dart';
import'package:flutter/material.dart';
import 'package:mathologists_chat/helper/helper_function.dart';
import 'package:mathologists_chat/pages/auth/login_page.dart';
import 'package:mathologists_chat/pages/home_page.dart';
import 'package:mathologists_chat/service/auth_service.dart';
import 'package:mathologists_chat/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.2),
        child: AppBar(
          backgroundColor: Colors.cyan,

        ),
      ),

      body: _isLoading? Center(child: CircularProgressIndicator(color: Colors.deepPurple,),):SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [const Text("YouChat", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
                const SizedBox(height: 10),
                const Text("Create your account now to Chat with your Favorite Creators!",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                Image.asset("assets/You chat.png",height: 260,
                  width: 260,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      labelText: "Full Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.cyan,
                      )),
                  onChanged: (val) {
                    setState(() {
                      fullName = val;
                    });
                  },
                  validator: (val) {
                    if (val!.isNotEmpty) {
                      return null;
                    } else {
                      return "Name cannot be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),

                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email_rounded, color: Colors.cyan),
                  ),
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                  //check whether user entered email in correct format
                  validator: (val){
                    return RegExp( r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val!)
                        ? null
                        : "Please enter a valid email address";
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.key_rounded, color: Colors.cyan),
                  ),
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Password must contain at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val){
                    setState(() {
                      password=val;
                    });
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),

                    child: const Text("Register", style: TextStyle(color: Colors.black, fontSize: 16)),
                    onPressed: (){
                      register();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(color: Colors.black26, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: " Login here",
                            style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              nextScreen(context, const LoginPage());
                            }
                        )
                      ],

                    )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          nextScreenReplacement(context, const HomePage());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
