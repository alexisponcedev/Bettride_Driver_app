import 'package:get/get.dart';
import 'package:taxi_booking/presentation/arriving/arriving_screen.dart';
import 'package:taxi_booking/presentation/auth/createNewPassword/create_new_password_screen.dart';
import 'package:taxi_booking/presentation/auth/findPasswordOption/find_password_option_screen.dart';
import 'package:taxi_booking/presentation/auth/login&signup/login_signup_screen.dart';
import 'package:taxi_booking/presentation/auth/passwordRecoveyviaMail/password_recovery_via_mail_screen.dart';
import 'package:taxi_booking/presentation/auth/verificationCode/verification_code_screen.dart';
import 'package:taxi_booking/presentation/auth/verifyphonenumber/verify_phone_number_screen.dart';
import 'package:taxi_booking/presentation/bottomBar/bottombar_screen.dart';
import 'package:taxi_booking/presentation/cancel_trip/cancel_trip_screen.dart';
import 'package:taxi_booking/presentation/change_password/change_password_screen.dart';
import 'package:taxi_booking/presentation/choose_trip/choose_trip_screen.dart';
import 'package:taxi_booking/presentation/driver_details/driver_details_screen.dart';
import 'package:taxi_booking/presentation/editAccount/edit_account_screen.dart';
import 'package:taxi_booking/presentation/faq/faq_screen.dart';
import 'package:taxi_booking/presentation/favorite_place/favorite_place_sceen.dart';
import 'package:taxi_booking/presentation/invite_friends/invite_friends_screen.dart';
import 'package:taxi_booking/presentation/language/language.dart';
import 'package:taxi_booking/presentation/my_promotions/my_promotions_screen.dart';
import 'package:taxi_booking/presentation/my_wallet/my_wallet_screen.dart';
import 'package:taxi_booking/presentation/notification/notification_screen.dart';
import 'package:taxi_booking/presentation/pay_tip/pay_tip_screen.dart';
import 'package:taxi_booking/presentation/payment/payment_screen.dart';
import 'package:taxi_booking/presentation/payment_history/payment_history_screen.dart';
import 'package:taxi_booking/presentation/payout/payout_screen.dart';
import 'package:taxi_booking/presentation/rate_driver/rate_driver_screen.dart';
import 'package:taxi_booking/presentation/reward/reward_screen.dart';
import 'package:taxi_booking/presentation/ride_history/ride_history_screen.dart';
import 'package:taxi_booking/presentation/searching_driver/searching_driver_screen.dart';
import 'package:taxi_booking/presentation/select_address/select_address_screen.dart';
import 'package:taxi_booking/presentation/send_tip/send_tip_screen.dart';
import 'package:taxi_booking/presentation/settings/setting_screen.dart';
import 'package:taxi_booking/presentation/splash/splash_screen.dart';
import 'package:taxi_booking/presentation/thankyou/thank_you_screen.dart';
import 'package:taxi_booking/presentation/trackAddress/track_address_screen.dart';
import 'package:taxi_booking/presentation/wellcomeSlider/wellcome_screen.dart';

import '../presentation/auth/DocumentsUpload/upload_documents_steps.dart';
import '../presentation/auth/Term&Conditions/termConditions.dart';
import '../presentation/auth/getUserData/getUserDataScreen.dart';
import '../presentation/auth/otpField/otpFieldScreen.dart';

class AppRoutes {
  static String splashScreen = '/splashScreen';
  static String wellcomeScreen = '/wellcomeScreen';
  static String loginSignUpScreen = '/loginSignUpScreen';
  static String otpFiledScreen = '/otpFiledScreen';
  static String TermAndConditionsScreen = '/TermAndConditionsScreen';
  static String GetUserDataScreen = '/GetUserData';
  static String bottomBarScreen = '/bottomBarScreen';
  static String findPasswordOptionScreen = '/findPasswordOptionScreen';
  static String passwordRecoveryViaMail = '/passwordRecoveryViaMail';
  static String verificationCodeScreen = '/verificationCodeScreen';
  static String createNewPasswordScreen = '/createNewPasswordScreen';
  static String editAccountScreen = '/editAccountScreen';
  static String paymentScreen = '/paymentScreen';
  static String selectAddressScreen = '/selectAddressScreen';
  static String favoritePlaceScreen = '/favoritePlaceScreen';
  static String settingScreen = '/settingScreen';
  static String paymentHistoryScreen = '/paymentHistoryScreen';
  static String rideHistoryScreen = '/rideHistoryScreen';
  static String driverDetailScreen = '/driverDetailScreen';
  static String rewardScreen = '/rewardScreen';
  static String inviteFriendScreen = '/inviteFriendScreen';
  static String myWalletScreen = '/myWalletScreen';
  static String myPromotionScreen = '/myPromotionScreen';
  static String faqScreen = '/faqScreen';
  static String notificationScreen = '/notificationScreen';
  static String cancelTripScreen = '/cancelTripScreen';
  static String payoutScreen = '/payoutScreen';
  static String chooseTripScreen = '/chooseTripScreen';
  static String searchingDriverScreen = '/searchingDriverScreen';
  static String arrivingScreen = '/arrivingScreen';
  static String rateDriverScreen = '/rateDriverScreen';
  static String paytipScreen = '/paytipScreen';
  static String sendTipScreen = '/sendTipScreen';
  static String verifyPhoneNumberScreen = '/verifyPhoneNumberScreen';
  static String changePasswordScreen = '/changePasswordScreen';
  static String languageListScreen = '/languageListScreen';
  static String trackAddressScreen = '/trackAddressScreen';
  static String thankyouScreen = '/thankyouScreen';
  static String documentUplaodScreen = '/DocumentUplaodScreen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: wellcomeScreen,
      page: () => WellcomeScreen(),
    ),
    GetPage(
      name: loginSignUpScreen,
      page: () => LoginSignUpScreen(),
    ),
    GetPage(
      name: otpFiledScreen,
      page: () => const EnterOtpScreen(),
    ),
    GetPage(
      name: TermAndConditionsScreen,
      page: () => const TermAndConditions(),
    ),
    GetPage(
      name: GetUserDataScreen,
      page: () => const GetUserData(),
    ),
    GetPage(
      name: bottomBarScreen,
      page: () => BottomBarScreen(),
    ),
    GetPage(
      name: findPasswordOptionScreen,
      page: () => const FindPasswordOptionScreen(),
    ),
    GetPage(
      name: passwordRecoveryViaMail,
      page: () => PasswordRecoveryScreen(),
    ),
    GetPage(
      name: verificationCodeScreen,
      page: () => VerificationCodeScreen(),
    ),
    GetPage(
      name: createNewPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: editAccountScreen,
      page: () => EditAccountScreen(),
    ),
    GetPage(
      name: paymentScreen,
      page: () => PaymentScreen(),
    ),
    GetPage(
      name: selectAddressScreen,
      page: () => const SelectAddressScreen(),
    ),
    GetPage(
      name: favoritePlaceScreen,
      page: () => FavoritePlaceScreen(),
    ),
    GetPage(
      name: settingScreen,
      page: () => SettingScreen(),
    ),
    GetPage(
      name: paymentHistoryScreen,
      page: () => PaymentHistoryScreen(),
    ),
    GetPage(
      name: rideHistoryScreen,
      page: () => RideHistoryScreen(),
    ),
    GetPage(
      name: driverDetailScreen,
      page: () => const DriverDetailScreen(),
    ),
    GetPage(
      name: rewardScreen,
      page: () => const RewardScreen(),
    ),
    GetPage(
      name: inviteFriendScreen,
      page: () => InviteFriendScreen(),
    ),
    GetPage(
      name: myWalletScreen,
      page: () => const MyWalletScreen(),
    ),
    GetPage(
      name: myPromotionScreen,
      page: () => const MyPromotionScreen(),
    ),
    GetPage(
      name: faqScreen,
      page: () => FAQScreen(),
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: cancelTripScreen,
      page: () => CancelTripScreen(),
    ),
    GetPage(
      name: payoutScreen,
      page: () => PayoutScreen(),
    ),
    GetPage(
      name: chooseTripScreen,
      page: () => ChooseTripScreen(),
    ),
    GetPage(
      name: searchingDriverScreen,
      page: () => const SearchingDriverScreen(),
    ),
    GetPage(
      name: arrivingScreen,
      page: () => ArrivingScreen(),
    ),
    GetPage(
      name: rateDriverScreen,
      page: () => const RateDriverScreen(),
    ),
    GetPage(
      name: paytipScreen,
      page: () => PayTipScreen(),
    ),
    GetPage(
      name: sendTipScreen,
      page: () => SendTipScreen(),
    ),
    GetPage(
      name: verifyPhoneNumberScreen,
      page: () => VerifyPhoneNumberScreen(),
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: languageListScreen,
      page: () => LanguageListScreen(),
    ),
    GetPage(
      name: trackAddressScreen,
      page: () => TrackAddressScreen(),
    ),
    GetPage(
      name: thankyouScreen,
      page: () => ThankyouScreen(),
    ),
    GetPage(
      name: documentUplaodScreen,
      page: () => const DocumentUplaodScreen(),
    ),
  ];
}
