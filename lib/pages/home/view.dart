import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/util/screen_adapter.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';
import 'package:realworld_flutter/common/widget/article_list.dart';
import 'package:realworld_flutter/common/widget/avatar_image.dart';
import 'package:realworld_flutter/pages/pages.dart';

import 'logic.dart';

class HomePage extends GetView<HomeLogic> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: PageBar(
        context: context,
        leftMenu: Text(
          'conduit',
          style: TextStyle(
            color: AppColors.main,
            fontSize: AppSize.s_48,
            fontWeight: FontWeight.bold,
          ),
        ),
        rightMenu: GetBuilder<HomeLogic>(
            id: 'rightMenu',
            builder: (c) => c.state.isLogin
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => c.goProfile(),
                    child: AvatarImage(
                      url: c.state.user.value?.image,
                      hasBorder: true,
                    ),
                  )
                : GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => c.login(),
                    child: Icon(
                      Icons.login_rounded,
                      size: AppSize.w_48,
                      color: AppColors.main,
                    ),
                  )),
      ),
      body: const ArticlesPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Pages.newArticle),
        child: Icon(
          Icons.add_rounded,
          size: AppSize.w_56,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.main,
      ),
    );
  }
}
