// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xff000000);
  static const Color black_80 = Color(0xcc000000);
  static const Color black_50 = Color(0x80000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color bg = Color(0xFFF0F0F0);
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

  static const Color app_FFFFFF_80 = Color(0xCDFFFFFF);
  static const Color app_FFFFFF = Color(0xffffffff);
  static const Color app_FFFEFE = Color(0xffFFFEFE);
  static const Color app_FFE8EE = Color(0xFFFFE8EE);
  static const Color app_FEC100 = Color(0xffFEC100);
  static const Color app_FEC100_20 = Color(0x33FEC100);
  static const Color app_BCBCBC = Color(0xFFBCBCBC);
  static const Color app_F6F6F6 = Color(0xFFF6F6F6);
  static const Color app_3F4240 = Color(0xFF3F4240);
  static const Color app_FF4466 = Color(0xFFFF4466);
  static const Color app_F0F0F0 = Color(0xFFF0F0F0);
  static const Color app_808080 = Color(0xFF808080);
  static const Color app_989898 = Color(0xFF989898);
  static const Color app_27292B = Color(0xFF27292B);
  static const Color app_AD48FC = Color(0xFFAD48FC);
  static const Color app_FCD8FF = Color(0xFFFCD8FF);
  static const Color app_FFF3FE = Color(0xFFFFF3FE);
  static const Color app_FFF3F4 = Color(0xFFFFF3F4);
  static const Color app_F2F4F5 = Color(0xFFF2F4F5);
  static const Color app_333333 = Color(0xFF333333);
  static const Color app_666666 = Color(0xFF666666);
  static const Color app_606060 = Color(0xFF606060);
  static const Color app_999999 = Color(0xFF999999);
  static const Color app_999999_10 = Color(0x1A999999);
  static const Color app_F7F7F7 = Color(0xFFE8E8E8);
  static const Color app_E6E6E6 = Color(0xFFE6E6E6);
  static const Color app_FFE6E6 = Color(0xFFFFE6E6);
  static const Color app_8E8E8E = Color(0xFFE8E8E8);
  static const Color app_FDF5E3 = Color(0xFFFDF5E3);
  static const Color app_FFEBEE = Color(0xFFFFEBEE);
  static const Color app_FF4365 = Color(0xFFFF4365);
  static const Color app_A3BDFA = Color(0xFFA3BDFA);
  static const Color app_E5E5E5 = Color(0xFFE5E5E5);
  static const Color app_979797 = Color(0xFF979797);
  static const Color app_3FCFE4 = Color(0xFF3FCFE4);
  static const Color app_282A2C = Color(0xFF282A2C);
  static const Color app_343434 = Color(0xFF343434);
  static const Color app_A4BEFB = Color(0xFFA4BEFB);
  static const Color app_383A3C = Color(0xFF383A3C);
  static const Color app_3C3C3C_30 = Color(0x3C3C3C30);
  static const Color app_A3BEFB = Color(0xFFA3BEFB);
  static const Color app_F73851 = Color(0xFFF73851);
  static const Color app_CCCCCC = Color(0xFFCCCCCC);
  static const Color app_1A1A1A = Color(0xFF1A1A1A);
  static const Color app_EEEEEE = Color(0xFFEEEEEE);
  static const Color app_E0E0E0 = Color(0xFFE0E0E0);
  static const Color app_FEAF71 = Color(0xFFFEAF71);
  static const Color app_9A9A9A = Color(0xFF9A9A9A);
  static const Color app_57BE6A = Color(0xFF57BE6A);
  static const Color app_010101 = Color(0xFF010101);
  static const Color app_DDDDDD = Color(0xFFDDDDDD);
  static const Color app_F8F8F8 = Color(0xFFF8F8F8);
  static const Color app_FFA9B5 = Color(0xFFFFA9B5);
  static const Color app_576B95 = Color(0xFF576B95);
  static const Color app_F76159 = Color(0xFFF76159);
  static const Color app_FF97C5 = Color(0xFFFF97C5);
  static const Color app_FE8478 = Color(0xFFFE8478);
  static const Color app_724DF3 = Color(0xFF724DF3);
  static const Color app_FEF5E4 = Color(0xFFFEF5E4);
  static const Color app_DEDEDE = Color(0xFFDEDEDE);
  static const Color app_E7E7E7 = Color(0xFFE7E7E7);
  static const Color app_D4AF89 = Color(0xFFD4AF89);
  static const Color app_E6CCAF = Color(0xFFE6CCAF);
  static const Color app_BF8C5A = Color(0xFFBF8C5A);
  static const Color app_BFBFBF = Color(0xFFBFBFBF);
  static const Color app_AD8D6B = Color(0xFFAD8D6B);
  static const Color app_B9946F = Color(0xFFB9946F);
  static const Color app_ECD5BA = Color(0xFFECD5BA);
  static const Color app_3B3B3B = Color(0xFF3B3B3B);
  static const Color app_FF435D = Color(0xFFFF435D);
  static const Color app_FE42A1 = Color(0xFFFE42A1);
  static const Color app_FF5DAF = Color(0xFFFF5DAF);
  static const Color app_BBBBBB = Color(0xFFBBBBBB);
  static const Color app_E26577 = Color(0xFFE26577);
  static const Color app_FFE4E4 = Color(0xFFFFE4E4);
  static const Color app_B12437 = Color(0xFFB12437);
  static const Color app_A7A7A7 = Color(0xFFA7A7A7);
  static const Color app_787B7C = Color(0xFF787B7C);
  static const Color app_FF1E1E = Color(0xFFFF1E1E);
  static const Color app_7373FE = Color(0xFF7373FE);
  static const Color app_4848FF = Color(0xFF4848FF);
  static const Color app_FFDE64 = Color(0xFFFFDE64);
  static const Color app_FAFAFA = Color(0xFFFAFAFA);
  static const Color app_888888 = Color(0xFF888888);

  static const Color app_FBF5E4 = Color(0xFFFBF5E4);
  static const Color app_FFF7E1 = Color(0xFFFFF7E1);
  static const Color app_FF872B = Color(0xFFFF872B);
  static const Color app_FFF2F4 = Color(0xFFFFF2F4);
  static const Color app_714EF1 = Color(0xFF714EF1);
  static const Color app_FE9000 = Color(0xFFFE9000);
  static const Color app_F5F5F5 = Color(0xFFF5F5F5);
  static const Color app_F2EEFF = Color(0xFFF2EEFF);
  static const Color app_552DE9 = Color(0xFF552DE9);
  static const Color app_9172FF = Color(0xFF9172FF);
  static const Color app_B9B9B9 = Color(0xFFB9B9B9);
  static const Color app_E8E8E8 = Color(0xFFE8E8E8);
  static const Color app_4A4A4A = Color(0xFF4A4A4A);
  static const Color app_FFF5D4 = Color(0xFFFFF5D4);
  static const Color app_f3f3f3 = Color(0xFFF3F3F3);
  static const Color app_ABABAB = Color(0xFFABABAB);
  static const Color app_FFA0AD = Color(0xFFFFA0AD);
  static const Color app_F7418C = Color(0xFFF7418C);
  static const Color app_FFDCDC = Color(0xFFFFDCDC);
  static const Color app_FFEDEF = Color(0xFFFFEDEF);
  static const Color app_DF9B7A = Color(0xFFDF9B7A);
  static const Color app_E8AA25 = Color(0xFFE8AA25);
  static const Color app_8A47EC = Color(0xFF8A47EC);
  static const Color app_6B45FF = Color(0xFF6B45FF);
  static const Color app_4100C2 = Color(0xFF4100C2);
  static const Color app_FF445E = Color(0xFFFF445E);
  static const Color app_FF445E_50 = Color(0x80FF445E);
  static const Color app_FF5901 = Color(0xFFFF5901);
  static const Color app_FFFAEF = Color(0xFFFFFAEF);
  static const Color app_FFF2CC = Color(0xFFFFF2CC);
  static const Color app_F8E9CA = Color(0xFFF8E9CA);
  static const Color app_FF762E = Color(0xFFFF762E);
  static const Color app_FFA963 = Color(0xFFFFA963);
  static const Color app_FFF6F8 = Color(0xFFFFF6F8);
  static const Color app_FFC900 = Color(0xFFFFC900);
  static const Color app_FF9501 = Color(0xFFFF9501);
  static const Color app_B2B2B2 = Color(0xFFB2B2B2);
  static const Color app_646464 = Color(0xFF646464);
  static const Color app_83533B = Color(0xFF83533B);
  static const Color app_98583C = Color(0xFF98583C);
  static const Color app_A56041 = Color(0xFFA56041);
  static const Color app_B14B58 = Color(0xFFB14B58);
  static const Color app_A5681C = Color(0xFFA5681C);
  static const Color app_674A80 = Color(0xFF674A80);
  static const Color app_955CE8 = Color(0xFF955CE8);
  static const Color app_A76C22 = Color(0xFFA76C22);
  static const Color app_967BC8 = Color(0xFF967BC8);
  static const Color app_FF9506 = Color(0xFFFF9506);
  static const Color app_FFF4E6 = Color(0xFFFFF4E6);
  static const Color app_FFF5F6 = Color(0xFFFFF5F6);
  static const Color app_AA2D3E = Color(0xFFAA2D3E);
  static const Color app_909090 = Color(0xFF909090);
  static const Color app_0075AA = Color(0xFF0075AA);
  static const Color app_00AE00 = Color(0xFF00AE00);
  static const Color app_00A9F2 = Color(0xFF00A9F2);
  static const Color app_09BB07 = Color(0xFF09BB07);
  static const Color app_8A8A8A = Color(0xFF8A8A8A);
  static const Color app_515151 = Color(0xFF515151);
  static const Color app_838A90 = Color(0xFF838A90);
}
