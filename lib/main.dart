import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Size? mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffe813f),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 50, left: 25, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize?.width,
      child: Text(
        "Log In",
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 35,
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize?.width,
      child: Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "To keep connected with us please login with your personal info",
              style: GoogleFonts.robotoFlex(
                  color: Colors.grey, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 25,
            ),
            _buildInputField(emailController),
            SizedBox(
              height: 15,
            ),
            _buildInputField(passController, isPassword: true),
            SizedBox(
              height: 25,
            ),
            _buildRememberForgot(),
            SizedBox(
              height: 25,
            ),
            Align(alignment: Alignment.center, child: _buildLoginButton()),
            SizedBox(
              height: 25,
            ),
          ],
        ),
        SizedBox(height: 40,),
        _buildOtherLogin(),
      ],
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: isPassword ? "Password" : "Email Address",
        isDense: true,
        isCollapsed: true,
        labelStyle: GoogleFonts.robotoFlex(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade500),
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
        suffixIconColor: Colors.black,
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        contentPadding: EdgeInsets.all(15),
        fillColor: Colors.grey.shade200,
      ),
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: CupertinoCheckbox(
                  activeColor: Color(0xfffe813f),
                  value: rememberUser,
                  onChanged: (value) {
                    setState(() {
                      rememberUser = value!;
                    });
                  }),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Remember me?",
              style: GoogleFonts.robotoFlex(fontSize: 13),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text("Forgot Password?",
              style: GoogleFonts.robotoFlex(
                  color: Color(0xfffe813f),
                  fontWeight: FontWeight.w700,
                  fontSize: 13)),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Log In",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          )),
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        backgroundColor: Color(0xfffe813f),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.50,
                  height: 50,
                  endIndent: 5,
                ),
              ),
            ),
            Text("OR CONTINUE WITH",
                style: GoogleFonts.robotoFlex(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500)),
            Expanded(
              child: Container(
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.50,
                  height: 50,
                  indent: 5,
                ),
              ),
            ),
          ],
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/wp_icon.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Login with WhatsApp",
                  style: GoogleFonts.robotoFlex(),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/google_icon.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Login with Google",
                  style: GoogleFonts.robotoFlex(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
