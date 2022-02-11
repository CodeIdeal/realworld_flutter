import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_config.dart';
import 'package:realworld_flutter/common/constant/app_keys.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/util/storage.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';
import 'package:realworld_flutter/common/widget/ripple_button.dart';

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
        rightMenu: GestureDetector(
          onTap: () => Get.dialog(SimpleDialog(
            title: const Text('Set the base url'),
            contentPadding: EdgeInsets.all(AppSize.w_24),
            children: [
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Base Url',
                  hintText:
                      Storage.getString(AppKeys.baseUrl) ?? AppConfig.baseUrl,
                ),
                controller: controller.urlController,
              ),
              SizedBox(height: AppSize.w_24),
              RippleButton(
                onTap: () => controller.setNewBaseUrl(),
                height: AppSize.w_96,
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.r_8)),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppSize.s_28,
                  ),
                ),
              )
            ],
          )),
          child: Icon(
            Icons.settings_rounded,
            size: AppSize.w_48,
            color: AppColors.main,
          ),
        ),
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
