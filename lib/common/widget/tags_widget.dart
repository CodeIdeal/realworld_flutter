import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/iterable_extensions.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/pages/pages.dart';

class Tags extends StatelessWidget {
  final List<String>? tags;

  const Tags({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tags == null || tags!.isEmpty) {
      return const SizedBox.shrink();
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: AppSize.w_1),
      child: Row(
        children: (tags!.mapMany((tag) => [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Get.toNamed(Pages.tagArticles, arguments: tag),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      AppSize.w_8, AppSize.w_4, AppSize.w_8, AppSize.w_4),
                  margin: EdgeInsets.only(right: AppSize.w_8),
                  decoration: BoxDecoration(
                    color: AppColors.transparent,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.r_12)),
                    border: Border.all(
                      color: AppColors.app_989898,
                      width: AppSize.w_1,
                    ),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: AppColors.app_989898,
                      fontSize: AppSize.s_16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ])).toList(),
      ),
    );
  }
}
