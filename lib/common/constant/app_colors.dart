import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xff000000);
  static const Color black_80 = Color(0xcc000000);
  static const Color black_50 = Color(0x80000000);
  static const Color white = Color(0xffffffff);

  static const Color bg = Color(0xFFf0f0f0);
  static const Color main = Color(0xFF74B566);

  static MaterialColor primaryColor = const MaterialColor(
    0xFF74B566,
    <int, Color>{
      50: Color.fromRGBO(
        116,
        181,
        102,
        .1,
      ),
      100: Color.fromRGBO(
        116,
        181,
        102,
        .2,
      ),
      200: Color.fromRGBO(
        116,
        181,
        102,
        .3,
      ),
      300: Color.fromRGBO(
        116,
        181,
        102,
        .4,
      ),
      400: Color.fromRGBO(
        116,
        181,
        102,
        .5,
      ),
      500: Color.fromRGBO(
        116,
        181,
        102,
        .6,
      ),
      600: Color.fromRGBO(
        116,
        181,
        102,
        .7,
      ),
      700: Color.fromRGBO(
        116,
        181,
        102,
        .8,
      ),
      800: Color.fromRGBO(
        116,
        181,
        102,
        .9,
      ),
      900: Color.fromRGBO(
        116,
        181,
        102,
        1,
      ),
    },
  );

  static const Color app_FFFFFF_80 = const Color(0xcdffffff);
  static const Color app_FFFFFF = const Color(0xffffffff);
  static const Color app_FFFEFE = const Color(0xffFFFEFE);
  static const Color app_FFE8EE = const Color(0xFFffe8ee);
  static const Color app_FEC100 = const Color(0xffFEC100);
  static const Color app_FEC100_20 = const Color(0x33fec100);
  static const Color app_BCBCBC = const Color(0xffBCBCBC);
  static const Color app_F6F6F6 = const Color(0xffF6F6F6);
  static const Color app_3F4240 = const Color(0xff3F4240);
  static const Color app_FF4466 = const Color(0xffff4466);
  static const Color app_F0F0F0 = const Color(0xffF0F0F0);
  static const Color app_808080 = const Color(0xff808080);
  static const Color app_989898 = const Color(0xff989898);
  static const Color app_27292B = const Color(0xff27292B);
  static const Color app_AD48FC = const Color(0xffAD48FC);
  static const Color app_FCD8FF = const Color(0xffFCD8FF);
  static const Color app_FFF3FE = const Color(0xffFFF3FE);
  static const Color app_FFF3F4 = const Color(0xffFFF3F4);
  static const Color app_F2F4F5 = const Color(0xffF2F4F5);
  static const Color app_333333 = const Color(0XFF333333);
  static const Color app_666666 = const Color(0XFF666666);
  static const Color app_606060 = const Color(0XFF606060);
  static const Color app_999999 = const Color(0XFF999999);
  static const Color app_999999_10 = const Color(0X1A999999);
  static const Color app_F7F7F7 = const Color(0XFFe8e8e8);
  static const Color app_E6E6E6 = const Color(0XFFE6E6E6);
  static const Color app_FFE6E6 = const Color(0XFFffe6e6);
  static const Color app_8E8E8E = const Color(0XFFe8e8e8);
  static const Color app_FDF5E3 = const Color(0XFFFDF5E3);
  static const Color app_FFEBEE = const Color(0XFFFFEBEE);
  static const Color app_FF4365 = const Color(0XFFFF4365);
  static const Color app_A3BDFA = const Color(0XFFA3BDFA);
  static const Color app_E5E5E5 = const Color(0XFFE5E5E5);
  static const Color app_979797 = const Color(0XFF979797);
  static const Color app_3FCFE4 = const Color(0XFF3FCFE4);
  static const Color app_282A2C = const Color(0XFF282A2C);
  static const Color app_343434 = const Color(0XFF343434);
  static const Color app_A4BEFB = const Color(0XFFA4BEFB);
  static const Color app_3C3C3C = const Color(0XFF3c3c3c);
  static const Color app_3C3C3C_30 = const Color(0X3c3c3c30);
  static const Color app_A3BEFB = const Color(0XFFA3BEFB);
  static const Color app_F73851 = const Color(0XFFF73851);
  static const Color app_CCCCCC = const Color(0XFFCCCCCC);
  static const Color app_1A1A1A = const Color(0XFF1A1A1A);
  static const Color app_EEEEEE = const Color(0XFFEEEEEE);
  static const Color app_E0E0E0 = const Color(0XFFE0E0E0);
  static const Color app_FEAF71 = const Color(0XFFFEAF71);
  static const Color app_9A9A9A = const Color(0XFF9A9A9A);
  static const Color app_57BE6A = const Color(0XFF57BE6A);
  static const Color app_010101 = const Color(0XFF010101);
  static const Color app_DDDDDD = const Color(0XFFDDDDDD);
  static const Color app_F8F8F8 = const Color(0XFFF8F8F8);
  static const Color app_FFA9B5 = const Color(0XFFFFA9B5);
  static const Color app_576B95 = const Color(0XFF576B95);
  static const Color app_F76159 = const Color(0XFFf76159);
  static const Color app_FF97C5 = const Color(0XFFff97c5);
  static const Color app_FE8478 = const Color(0XFFfe8478);
  static const Color app_724DF3 = const Color(0XFF724DF3);
  static const Color app_FEF5E4 = const Color(0XFFfef5e4);
  static const Color app_DEDEDE = const Color(0XFFdedede);
  static const Color app_E7E7E7 = const Color(0XFFe7e7e7);
  static const Color app_D4AF89 = const Color(0XFFd4af89);
  static const Color app_E6CCAF = const Color(0XFFE6CCAF);
  static const Color app_BF8C5A = const Color(0XFFBF8C5A);
  static const Color app_BFBFBF = const Color(0XFFBFBFBF);
  static const Color app_AD8D6B = const Color(0XFFAD8D6B);
  static const Color app_B9946F = const Color(0XFFB9946F);
  static const Color app_ECD5BA = const Color(0XFFecd5ba);
  static const Color app_3B3B3B = const Color(0XFF3B3B3B);
  static const Color app_FF435D = const Color(0XFFFF435D);
  static const Color app_FE42A1 = const Color(0XFFfe42a1);
  static const Color app_FF5DAF = const Color(0XFFff5daf);
  static const Color app_BBBBBB = const Color(0XFFBBBBBB);
  static const Color app_E26577 = const Color(0XFFE26577);
  static const Color app_FFE4E4 = const Color(0xffFFE4E4);
  static const Color app_B12437 = const Color(0xffb12437);
  static const Color app_A7A7A7 = const Color(0xffa7a7a7);
  static const Color app_787B7C = const Color(0xff787B7C);
  static const Color app_FF1E1E = const Color(0xffFF1E1E);
  static const Color app_7373FE = const Color(0xff7373FE);
  static const Color app_4848FF = const Color(0xff4848FF);
  static const Color app_FFDE64 = const Color(0xffFFDE64);
  static const Color app_FAFAFA = const Color(0xfffafafa);
  static const Color app_888888 = const Color(0xff888888);

  static const Color app_FBF5E4 = const Color(0XFFFBF5E4);
  static const Color app_FFF7E1 = const Color(0XFFFFF7E1);
  static const Color app_FF872B = const Color(0XFFFF872B);
  static const Color app_FFF2F4 = const Color(0XFFFFF2F4);
  static const Color app_714EF1 = const Color(0XFF714EF1);
  static const Color app_FE9000 = const Color(0XFFFE9000);
  static const Color app_F5F5F5 = const Color(0XFFF5F5F5);
  static const Color app_F2EEFF = const Color(0XFFF2EEFF);
  static const Color app_552DE9 = const Color(0XFF552DE9);
  static const Color app_9172FF = const Color(0XFF9172FF);
  static const Color app_B9B9B9 = const Color(0XFFB9B9B9);
  static const Color app_E8E8E8 = const Color(0XFFE8E8E8);
  static const Color app_4A4A4A = const Color(0XFF4a4a4a);
  static const Color app_FFF5D4 = const Color(0XFFFFF5D4);
  static const Color app_f3f3f3 = const Color(0XFFf3f3f3);
  static const Color app_ABABAB = const Color(0XFFABABAB);
  static const Color app_FFA0AD = const Color(0XFFFFA0AD);
  static const Color app_F7418C = const Color(0xffF7418C);
  static const Color app_FFDCDC = const Color(0xffFFDCDC);
  static const Color app_FFEDEF = const Color(0xffFFEDEF);
  static const Color app_DF9B7A = const Color(0xffDF9B7A);
  static const Color app_E8AA25 = const Color(0xffE8AA25);
  static const Color app_8A47EC = const Color(0xff8A47EC);
  static const Color app_6B45FF = const Color(0xff6B45FF);
  static const Color app_4100C2 = const Color(0xff4100C2);
  static const Color app_FF445E = const Color(0xffff445e);
  static const Color app_FF445E_50 = const Color(0x80ff445e);
  static const Color app_FF5901 = const Color(0xffFF5901);
  static const Color app_FFFAEF = const Color(0xffFFFAEF);
  static const Color app_FFF2CC = const Color(0xffFFF2CC);
  static const Color app_F8E9CA = const Color(0xffF8E9CA);
  static const Color app_FF762E = const Color(0xffFF762E);
  static const Color app_FFA963 = const Color(0xffFFA963);
  static const Color app_FFF6F8 = const Color(0xffFFF6F8);
  static const Color app_FFC900 = const Color(0xffFFC900);
  static const Color app_FF9501 = const Color(0xffFF9501);
  static const Color app_B2B2B2 = const Color(0xffB2B2B2);
  static const Color app_646464 = const Color(0xff646464);
  static const Color app_83533B = const Color(0xff83533B);
  static const Color app_98583C = const Color(0xff98583C);
  static const Color app_A56041 = const Color(0xffA56041);
  static const Color app_B14B58 = const Color(0xffB14B58);
  static const Color app_A5681C = const Color(0xffA5681C);
  static const Color app_674A80 = const Color(0xff674A80);
  static const Color app_955CE8 = const Color(0xff955CE8);
  static const Color app_A76C22 = const Color(0xffA76C22);
  static const Color app_967BC8 = const Color(0xff967BC8);
  static const Color app_FF9506 = const Color(0xffFF9506);
  static const Color app_FFF4E6 = const Color(0xffFFF4E6);
  static const Color app_FFF5F6 = const Color(0xffFFF5F6);
  static const Color app_AA2D3E = const Color(0xffAA2D3E);
  static const Color app_909090 = const Color(0xff909090);
  static const Color app_0075AA = const Color(0xff0075AA);
  static const Color app_00AE00 = const Color(0xff00AE00);
  static const Color app_00A9F2 = const Color(0xff00A9F2);
  static const Color app_09BB07 = const Color(0xff09BB07);
  static const Color app_8A8A8A = const Color(0xff8A8A8A);
  static const Color app_515151 = const Color(0xff515151);
}
