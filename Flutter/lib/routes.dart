import 'package:flutter/material.dart';

import 'package:flutter_app/views/screens/tabs/font_resizing_screen.dart';
import 'package:flutter_app/views/screens/tabs/presentation/gallery_screen.dart';
import 'package:flutter_app/views/screens/home_screen.dart';
import 'package:flutter_app/views/screens/tabs/auth_and_profile/sign_up_screen.dart';
import 'package:flutter_app/views/screens/tabs/auth_and_profile/verify_email_screen.dart';
import 'package:flutter_app/views/screens/tabs/text_to_speech/text_to_speech_more_screen.dart';
import 'package:flutter_app/views/screens/tabs/text_to_speech/text_to_speech_screen.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  // SCREENS
  static const HOME_SCREEN = '/homeScreen';
  static const GALLERY_SCREEN = '/galleryScreen';
  static const TEXT_TO_SPEECH_SCREEN = '/textToSpeechScreen';
  static const TEXT_TO_SPEECH__MORE_SCREEN = '/textToSpeechMoreScreen';
  static const SELECT_FONT_SIZE_SCREEN = '/selectFontSizeScreen';
  static const verifyEmailScreen = "/verify-email";
  static const signUpPage = "/sign-up";

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      HOME_SCREEN: (context) => HomeScreen(),
      GALLERY_SCREEN: (context) => GalleryScreen(),
      TEXT_TO_SPEECH_SCREEN: (context) => TextToSpeechScreen(),
      TEXT_TO_SPEECH__MORE_SCREEN: (context) => TextToSpeechMoreScreen(),
      SELECT_FONT_SIZE_SCREEN: (context) => SelectFontSizeScreen(),
      verifyEmailScreen: (context) => VerifyEmailPage(),
      signUpPage: (context) => SignUpScreen(),
    };

    WidgetBuilder? builder = routes[settings.name];
    return MaterialPageRoute(builder: (context) => builder!(context));
  }

  static navigateToScreen(
      String screenName, String navigateType, dynamic arguments, BuildContext context) async {
    switch (navigateType) {
      case NavigateType.PUSH_NAMED:
        Navigator.of(context).pushNamed(screenName, arguments: arguments);
        break;

      case NavigateType.PUSH_REPLACEDNAMENT_NAMED:
        Navigator.popAndPushNamed(context, screenName, arguments: arguments);
        break;

      case NavigateType.POP_AND_PUSH_NAMED:
        Navigator.of(context).pushReplacementNamed(screenName, arguments: arguments);
        break;

      default:
        break;
    }
  }

  static navigateWithTransition({
    required Widget screenWidget,
    PageTransitionType? pageTransitionType,
    required BuildContext context,
  }) {
    bool isRtl = true; // TODO
    var transitionType = pageTransitionType != null
        ? pageTransitionType
        : isRtl
            ? PageTransitionType.leftToRight
            : PageTransitionType.rightToLeftWithFade;
    Navigator.push(
      context,
      PageTransition(
        type: transitionType,
        child: screenWidget,
        curve: Curves.easeInOutExpo,
        inheritTheme: true,
        ctx: context,
      ),
    );
  }
}

class NavigateType {
  static const PUSH = 'push';
  static const PUSH_NAMED = 'pushNamed';
  static const PUSH_REPLACEDNAMENT_NAMED = 'pushReplacementNamed';
  static const POP_AND_PUSH_NAMED = 'popAndPushNamed';
}
