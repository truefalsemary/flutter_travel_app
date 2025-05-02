import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/common/ui/app_colors.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appScopeHolder = AppScopeHolder();

  @override
  void initState() {
    super.initState();
    _appScopeHolder.create();
  }

  @override
  Widget build(BuildContext context) {
    return ScopeProvider(
      holder: _appScopeHolder,
      child: ScopeBuilder<AppScopeContainer>.withPlaceholder(
        builder: (context, appScope) => ValueListenableBuilder<ThemeMode>(
          valueListenable: appScope.themeModeProvider,
          builder: (context, themeMode, _) => MaterialApp.router(
            routerConfig: appScope.routerDelegate,
            themeMode: themeMode,
            theme: ThemeData.light(useMaterial3: true).copyWith(
              extensions: <ThemeExtension>[
                AppColorsTheme.light(),
              ],
            ),
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
              extensions: <ThemeExtension>[
                AppColorsTheme.dark(),
              ],
            ),
          ),
        ),
        placeholder: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    _appScopeHolder.drop();
    super.dispose();
  }
}
