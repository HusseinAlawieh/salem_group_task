import 'package:flutter/material.dart';

class registrationForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:    Text ("Registration",
          style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        elevation: 5,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Form(

          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(15.0),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          makeInput(label: "Name"),
                          makeInput(label: "Email"),
                          makeInput(label: "Password",obsureText: true),
                          makeInput(label: "Confirm Pasword",obsureText: true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3,left: 3),

                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:40,
                          onPressed: (){_formKey.currentState!.validate();},
                          color: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Register",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,

                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        Text("Login",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),
                      ],
                    ),
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label,obsureText = false}){
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
if(label=="Name")
  TextFormField
    (
    controller: name,
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
    validator: (value) {
      if (value == null || value.isEmpty ) {
        return 'Please enter valid name';
      }
      return null;
    },
      ),
 if(label=="Email")
   TextFormField
     (
     controller: email,
     keyboardType: TextInputType.emailAddress,
     obscureText: obsureText,
     decoration: const InputDecoration(
       contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
       enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(
           color: Colors.grey,
         ),
       ),
       border: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.grey)
       ),
     ),
     validator: (value) {
       if (value == null || value.isEmpty || !isEmail(value)) {
         return 'Please enter valid email';
       }
       return null;
     },
   ),
  if(label=="Password")
    TextFormField
      (
      controller: password,
      keyboardType: TextInputType.emailAddress,
      obscureText: obsureText,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
      ),
      validator: (value) {
        if ( value!.isEmpty ||value.length <7) {
          return 'Password must be 7 characters';
        }
        if(!isValidPassword(value)){
          return 'must have capital char,number,special char';
        }
        return null;
      },
    ),
if(label=="Confirm Pasword")
  TextFormField
    (
    controller: confirmPassword,
    keyboardType: TextInputType.emailAddress,
    obscureText: obsureText,
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
      ),
    ),
    validator: (value) {
      if(value != password.text){
        return "passwords don't match";
      }
      return null;
    },
  ),
      SizedBox(height: 5,)

    ],
  );
}
bool isEmail(String email){
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}
bool isValidPassword(String password){
  return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);
}