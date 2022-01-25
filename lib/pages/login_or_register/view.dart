import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
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
        padding: EdgeInsets.all(AppSize.w_16),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                    AppSize.w_48,
                    AppSize.w_144,
                    AppSize.w_48,
                    AppSize.w_96,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.w_200),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/image/logo.png',
                      height: AppSize.w_110,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSize.w_24),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'mail',
                        hintText: 'Enter valid mail id as abc@gmail.com'),
                    controller: controller.mailController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSize.w_24),
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your secure password'),
                    controller: controller.passwordController,
                  ),
                ),
                SizedBox(height: AppSize.w_96),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.w_32),
                  child: MaterialButton(
                    onPressed: () => controller.login(),
                    height: AppSize.w_96,
                    minWidth: AppSize.w_600,
                    color: AppColors.main,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.w_48)),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSize.s_28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: Text(
                    'New User? Create Account',
                    style: TextStyle(
                        color: AppColors.app_383A3C, fontSize: AppSize.s_24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
