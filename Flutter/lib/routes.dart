import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/font_resizing_screen.dart';
import 'package:flutter_app/views/screens/gallery_screen.dart';
import 'package:flutter_app/views/screens/home_screen.dart';
import 'package:flutter_app/views/screens/text_to_speech_screen.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  // SCREENS
  static const HOME_SCREEN = '/homeScreen';
  static const GALLERY_SCREEN = '/galleryScreen';
  static const TEXT_TO_SPEECH_SCREEN = '/textToSpeechScreen';
  static const SELECT_FONT_SIZE_SCREEN = '/selectFontSizeScreen';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      HOME_SCREEN: (context) => HomeScreen(),
      GALLERY_SCREEN: (context) => GalleryScreen(),
      TEXT_TO_SPEECH_SCREEN: (context) => TextToSpeechScreen(),
      SELECT_FONT_SIZE_SCREEN: (context) => SelectFontSizeScreen(),
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
