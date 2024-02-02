import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marboket_app/app/managers/provider_manager.dart';
import 'package:marboket_app/app/managers/route_manager_import.dart';
import 'package:marboket_app/app/services/api_service.dart';
import 'package:marboket_app/app/stores/app_store.dart';
import 'package:marboket_app/app/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  ApiService apiService =
      ApiService("https://marboket.azurewebsites.net/api/Products");
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ProviderManager.providers],
      child: Consumer<AppStore>(builder: (_, store, __) {
        return Observer(builder: (_) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // localizationsDelegates: const [
            //   S.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // locale: store.locale,
            // supportedLocales: S.delegate.supportedLocales,
            // onGenerateTitle: (context) => S.of(context).appName,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: store.themeMode,
            routes: {...RouteManager.routes},
            initialRoute: RouteManager.productList,
          );
        });
      }),
    );
  }
}
