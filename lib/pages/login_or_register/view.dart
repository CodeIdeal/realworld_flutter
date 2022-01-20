import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';

import 'logic.dart';

class LoginOrRegisterPage extends GetView<LoginOrRegisterLogic> {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PageBar(
        context: context,
        title: 'Login/Register',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(48.w,144.w,48.w,96.w,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.w),
              ),
              child: Center(
                child: Image.asset(
                  'assets/image/logo.png',
                  height: 110.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'mail',
                    hintText: 'Enter valid mail id as abc@gmail.com'),
                controller: controller.mailController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password'),
                controller: controller.passwordController,
              ),
            ),
            SizedBox(height: 96.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: MaterialButton(
                onPressed: () => controller.login(),
                height: 96.w,
                minWidth: 600.w,
                color: AppColors.main,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48.w)),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'New User? Create Account',
                style: TextStyle(color: AppColors.app_383A3C, fontSize: 24.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
