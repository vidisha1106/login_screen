import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
      designSize: Size(1600, 720),
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
    debugPrint("${mediaSize?.width}");
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfffe813f),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 50.h, left: 25.h, child: _buildTop()),
            Positioned(bottom: 0.h, child: _buildBottom(), top: 125.h),
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
          fontSize: 125.sp,
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize?.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.r),
                topRight: Radius.circular(100.r))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
          child: _buildForm(),
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
                fontSize: 100.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              "To keep connected with us please login with your personal info",
              style: GoogleFonts.robotoFlex(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.5),
            ),
            SizedBox(
              height: 25.h,
            ),
            _buildInputField(emailController),
            SizedBox(
              height: 15.h,
            ),
            _buildInputField(passController, isPassword: true),
            SizedBox(
              height: 5.h,
            ),
            _buildRememberForgot(),
            SizedBox(
              height: 25.h,
            ),
            Align(alignment: Alignment.center, child: _buildLoginButton()),
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
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
            fontSize: 50.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade500),
        suffixIcon: isPassword
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.done),
        suffixIconColor: Colors.black,
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        contentPadding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 50.w),
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
                  activeColor: const Color(0xfffe813f),
                  value: rememberUser,
                  onChanged: (value) {
                    setState(() {
                      rememberUser = value!;
                    });
                  }),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "Remember me?",
              style: GoogleFonts.robotoFlex(fontSize: 50.sp),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text("Forgot Password?",
              style: GoogleFonts.robotoFlex(
                  color: const Color(0xfffe813f),
                  fontWeight: FontWeight.w700,
                  fontSize: 50.sp)),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50.h),
        backgroundColor: const Color(0xfffe813f),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.r),
          ),
        ),
      ),
      child: Text("Log In",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 75.sp,
          )),
    );
  }

  Widget _buildOtherLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 0.3.h,
                height: 50.h,
                endIndent: 25.w,
              ),
            ),
            Text("OR CONTINUE WITH",
                style: GoogleFonts.robotoFlex(
                    fontSize: 25.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500)),
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 0.3.h,
                height: 50.h,
                indent: 25.w,
              ),
            ),
          ],
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.5.w),
              borderRadius: BorderRadius.all(Radius.circular(50.r))),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.0.h,
                  width: 25.0.h,
                  child: SvgPicture.asset("assets/icons/wp_icon.svg"),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Text(
                  "Login with WhatsApp",
                  style: GoogleFonts.robotoFlex(
                      fontSize: 50.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.5.w),
              borderRadius: BorderRadius.all(Radius.circular(50.r))),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.0.h,
                  width: 25.0.h,
                  child: SvgPicture.asset("assets/icons/google_icon.svg"),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Text(
                  "Login with Google",
                  style: GoogleFonts.robotoFlex(
                      fontSize: 50.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
