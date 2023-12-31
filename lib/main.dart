import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/app.dart';
import 'package:flutter_demo/stores/StatesProvider.dart';
import 'package:flutter_demo/themes/theme.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter("./");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<StatesProvider>(
        create: (context) => StatesProvider()),
  ], child: HelloWorld()));
}

class HelloWorld extends StatelessWidget {
  HelloWorld({super.key});
  final botToastBuilder = BotToastInit();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /** iPhone6s */
    ScreenUtil.init(context, designSize: const Size(375, 667));
    return MaterialApp(
      title: 'Flutter Demo',
      /** BotToast */
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        Widget newWidget = Container();
        if (child == null) {
        } else {
          newWidget = MediaQuery(
            data: data.copyWith(textScaleFactor: 1.0),
            child: child,
          );
          newWidget = botToastBuilder(context, newWidget);
        }
        return newWidget;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: 'HarmonyOS-Sans'),
      home: AppPage(),
    );
  }
}
