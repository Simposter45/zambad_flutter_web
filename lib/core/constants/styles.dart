import 'package:first_proj/core/constants/colors.dart';
import 'package:flutter/material.dart';

const poppinsFontFamily = 'Sans-serif';
const latoFontFamily = 'Lato';

const nunitoFamily = 'Nunito';

const nunitoSansFamily = 'NunitoSans';

const sairaFamily = 'Saira';

class AppTextStyles {
  //Zambad App

  static const TextStyle nunitoNormal = TextStyle(
    fontFamily: nunitoFamily,
    fontSize: 20,
    color: Colors.black,
  );
  static const TextStyle nunitoBold = TextStyle(
    fontFamily: nunitoFamily,
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle nunitoSansNormal = TextStyle(
    fontFamily: nunitoSansFamily,
    fontSize: 20,
    color: Colors.black,
  );
  static const TextStyle nunitoSansBold = TextStyle(
    fontFamily: nunitoSansFamily,
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle sairaNormal = TextStyle(
    fontFamily: sairaFamily,
    fontSize: 14,
    color: Colors.black,
  );
  static const TextStyle sairaGoldSmall = TextStyle(
    fontFamily: sairaFamily,
    fontSize: 10,
    color: AppColors.deepGold,
  );
  static const TextStyle sairaGoldMedium = TextStyle(
    fontFamily: sairaFamily,
    fontSize: 16,
    color: AppColors.deepGold,
  );
  static const TextStyle sairaWhiteBoldSmall = TextStyle(
    fontFamily: sairaFamily,
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sairaWhiteBoldMedium = TextStyle(
    fontFamily: sairaFamily,
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sairaDeepGrey = TextStyle(
    fontFamily: sairaFamily,
    fontSize: 20,
    color: AppColors.deepGrey,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sairaLightGrey = TextStyle(
    fontFamily: sairaFamily,
    fontSize: 20,
    color: AppColors.lightGrey,
    fontWeight: FontWeight.bold,
  );
}

  //------------------------
  //Others
  //------------------------

//   static const TextStyle poppins20blackbold = TextStyle(
//     fontFamily: poppinsFontFamily,
//     fontSize: 20,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle poppins20white = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 20, color: Colors.white);

//   static const TextStyle poppins20whitebold = TextStyle(
//     fontFamily: poppinsFontFamily,
//     fontSize: 20,
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle poppins30white = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 30, color: Colors.white);

//   static const TextStyle poppins30black = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 30, color: Colors.black);

//   static const TextStyle poppins14black = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 14, color: Colors.black);

//   static const TextStyle poppins14white = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 14, color: Colors.white);
//   static const TextStyle poppins12black = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 12, color: Colors.black);
//   static const TextStyle poppins12white = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 12, color: Colors.white);

//   static const TextStyle poppins18black = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 18, color: Colors.black);

//   static const TextStyle poppins18white = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 18, color: Colors.white);

//   static const TextStyle poppins24black = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 24, color: Colors.black);

//   static const TextStyle poppins24white = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 24, color: Colors.white);

//   static const TextStyle poppins24Grey1 = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 24, color: AppColors.grey1);

//   static const TextStyle poppins24blackBold = TextStyle(
//     fontFamily: poppinsFontFamily,
//     fontSize: 24,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle poppins24whiteBold = TextStyle(
//     fontFamily: poppinsFontFamily,
//     fontSize: 24,
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle poppins18grey3 = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 18, color: AppColors.grey3);

//   static const TextStyle poppins18grey6 = TextStyle(
//     fontFamily: poppinsFontFamily,
//     fontSize: 18,
//     color: AppColors.grey6,
//     fontWeight: FontWeight.normal,
//   );

//   static const TextStyle poppins18grey6bold = TextStyle(
//     fontFamily: poppinsFontFamily,
//     fontSize: 18,
//     color: AppColors.grey6,
//     fontWeight: FontWeight.bold,
//   );
//   static const TextStyle poppins16black = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: Colors.black);
//   static const TextStyle poppins16white = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: Colors.white);

//   static const TextStyle poppins16grey1 = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: AppColors.grey1);

//   static const TextStyle poppins16grey2 = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: AppColors.grey2);

//   static const TextStyle poppins16grey3 = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: AppColors.grey3);

//   static const TextStyle poppins16darkColor = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: AppColors.darkColor);
//   static const TextStyle poppins16profileTextColor = TextStyle(
//       fontFamily: poppinsFontFamily,
//       fontSize: 16,
//       color: AppColors.profileTextColor);
//   static const TextStyle poppins16darkBlue = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: AppColors.darkBlue);

//   static const TextStyle poppins16dark = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: AppColors.dark);

//   static const TextStyle poppins16darkGrey = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 16, color: AppColors.darkGrey);

//   static const TextStyle poppins14grey3 = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 14, color: AppColors.grey3);

//   static const TextStyle poppins18greybold = TextStyle(
//     fontFamily: poppinsFontFamily,
//     fontSize: 18,
//     color: AppColors.grey1,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle poppins24grey2 = TextStyle(
//       fontFamily: poppinsFontFamily, fontSize: 24, color: AppColors.grey2);

//   static const TextStyle urbanist20black =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 20, color: Colors.black);

//   static const TextStyle urbanist20blackbold = TextStyle(
//     fontFamily: nunitoFamily,
//     fontSize: 20,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle urbanist20white =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 20, color: Colors.white);

//   static const TextStyle urbanist20whitebold = TextStyle(
//     fontFamily: nunitoFamily,
//     fontSize: 20,
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle urbanist30white =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 30, color: Colors.white);

//   static const TextStyle urbanist30black =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 30, color: Colors.black);

//   static const TextStyle urbanist14black =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 14, color: Colors.black);

//   static const TextStyle urbanist14white =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 14, color: Colors.white);
//   static const TextStyle urbanist12black =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 12, color: Colors.black);
//   static const TextStyle urbanist12white =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 12, color: Colors.white);

//   static const TextStyle urbanist18black =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 18, color: Colors.black);

//   static const TextStyle urbanist18white =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 18, color: Colors.white);

//   static const TextStyle urbanist24black =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 24, color: Colors.black);
//   static const TextStyle urbanist24white =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 24, color: Colors.white);

//   static const TextStyle urbanist24Grey1 =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 24, color: AppColors.grey1);

//   static const TextStyle urbanist24blackBold = TextStyle(
//     fontFamily: nunitoFamily,
//     fontSize: 24,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle urbanist24whiteBold = TextStyle(
//     fontFamily: nunitoFamily,
//     fontSize: 24,
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle urbanist18grey3 =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 18, color: AppColors.grey3);

//   static const TextStyle urbanist18grey6 = TextStyle(
//     fontFamily: nunitoFamily,
//     fontSize: 18,
//     color: AppColors.grey6,
//     fontWeight: FontWeight.normal,
//   );

//   static const TextStyle urbanist18grey6bold = TextStyle(
//     fontFamily: nunitoFamily,
//     fontSize: 18,
//     color: AppColors.grey6,
//     fontWeight: FontWeight.bold,
//   );
//   static const TextStyle urbanist16black =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 16, color: Colors.black);
//   static const TextStyle urbanist16white =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 16, color: Colors.white);

//   static const TextStyle urbanist16grey1 =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 16, color: AppColors.grey1);

//   static const TextStyle urbanist16grey2 =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 16, color: AppColors.grey2);

//   static const TextStyle urbanist16grey3 =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 16, color: AppColors.grey3);

//   static const TextStyle urbanist16darkColor = TextStyle(
//       fontFamily: nunitoFamily, fontSize: 16, color: AppColors.darkColor);

//   static const TextStyle urbanist16profileTextColor = TextStyle(
//       fontFamily: nunitoFamily,
//       fontSize: 16,
//       color: AppColors.profileTextColor);
//   static const TextStyle urbanist16darkBlue = TextStyle(
//       fontFamily: nunitoFamily, fontSize: 16, color: AppColors.darkBlue);

//   static const TextStyle urbanist16dark =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 16, color: AppColors.dark);

//   static const TextStyle urbanist16darkGrey = TextStyle(
//       fontFamily: nunitoFamily, fontSize: 16, color: AppColors.darkGrey);

//   static const TextStyle urbanist14grey3 =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 14, color: AppColors.grey3);

//   static const TextStyle urbanist18greybold = TextStyle(
//     fontFamily: nunitoFamily,
//     fontSize: 18,
//     color: AppColors.grey1,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle urbanist24grey2 =
//       TextStyle(fontFamily: nunitoFamily, fontSize: 24, color: AppColors.grey2);

//   static const TextStyle lato20black =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 20, color: Colors.black);

//   static const TextStyle lato20blackbold = TextStyle(
//     fontFamily: latoFontFamily,
//     fontSize: 20,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle lato20white =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 20, color: Colors.white);

//   static const TextStyle lato20whitebold = TextStyle(
//     fontFamily: latoFontFamily,
//     fontSize: 20,
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle lato30white =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 30, color: Colors.white);

//   static const TextStyle lato30black =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 30, color: Colors.black);

//   static const TextStyle lato14black =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 14, color: Colors.black);

//   static const TextStyle lato14white =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 14, color: Colors.white);
//   static const TextStyle lato12black =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 12, color: Colors.black);
//   static const TextStyle lato12white =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 12, color: Colors.white);

//   static const TextStyle lato18black =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 18, color: Colors.black);

//   static const TextStyle lato18white =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 18, color: Colors.white);

//   static const TextStyle lato24black =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 24, color: Colors.black);
//   static const TextStyle lato24white =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 24, color: Colors.white);

//   static const TextStyle lato24Grey1 = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 24, color: AppColors.grey1);

//   static const TextStyle lato24blackBold = TextStyle(
//     fontFamily: latoFontFamily,
//     fontSize: 24,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle lato24whiteBold = TextStyle(
//     fontFamily: latoFontFamily,
//     fontSize: 24,
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle lato18grey3 = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 18, color: AppColors.grey3);

//   static const TextStyle lato18grey6 = TextStyle(
//     fontFamily: latoFontFamily,
//     fontSize: 18,
//     color: AppColors.grey6,
//     fontWeight: FontWeight.normal,
//   );

//   static const TextStyle lato18grey6bold = TextStyle(
//     fontFamily: latoFontFamily,
//     fontSize: 18,
//     color: AppColors.grey6,
//     fontWeight: FontWeight.bold,
//   );
//   static const TextStyle lato16black =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 16, color: Colors.black);
//   static const TextStyle lato16white =
//       TextStyle(fontFamily: latoFontFamily, fontSize: 16, color: Colors.white);

//   static const TextStyle lato16grey1 = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 16, color: AppColors.grey1);

//   static const TextStyle lato16grey2 = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 16, color: AppColors.grey2);

//   static const TextStyle lato16grey3 = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 16, color: AppColors.grey3);

//   static const TextStyle lato16darkColor = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 16, color: AppColors.darkColor);
//   static const TextStyle lato16profileTextColor = TextStyle(
//       fontFamily: latoFontFamily,
//       fontSize: 16,
//       color: AppColors.profileTextColor);
//   static const TextStyle lato16darkBlue = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 16, color: AppColors.darkBlue);

//   static const TextStyle lato16dark = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 16, color: AppColors.dark);

//   static const TextStyle lato16darkGrey = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 16, color: AppColors.darkGrey);

//   static const TextStyle lato14grey3 = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 14, color: AppColors.grey3);

//   static const TextStyle lato18greybold = TextStyle(
//     fontFamily: latoFontFamily,
//     fontSize: 18,
//     color: AppColors.grey1,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle lato24grey2 = TextStyle(
//       fontFamily: latoFontFamily, fontSize: 24, color: AppColors.grey2);
// }
