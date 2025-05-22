import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_travel_app/src/app/data/shared_preferences_storage.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/features/content/shared/di/content_scope_provider.dart';
import 'package:flutter_travel_app/src/l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

void main() async {
  // final appDir = await getApplicationDocumentsDirectory();
  // final storage = await HydratedStorage.build(
  //   storageDirectory: appDir,
  // );

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await SharedPreferencesHydratedStorage.getInstance();
  final mapkitApiKey = '13479c75-c4ba-456c-b377-449d4f1f5da2';

   init.initMapkit(apiKey: mapkitApiKey);
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
        builder: (context, appScope) => ContentScopeProvider(
          appScope: appScope,
          child: ValueListenableBuilder<ThemeMode>(
            valueListenable: appScope.themeModeProvider,
            builder: (context, themeMode, _) => MaterialApp.router(
              routerConfig: appScope.routerDelegate,
              themeMode: themeMode,
              theme: ThemeData.light(useMaterial3: true).copyWith(
                sliderTheme: SliderThemeData(
                  activeTrackColor: AppColors.gold,
                  thumbColor: AppColors.gold,
                  inactiveTrackColor: AppColors.veryLightGrey,
                  inactiveTickMarkColor: AppColors.veryLightGrey,
                  activeTickMarkColor: AppColors.gold,
                  rangeTickMarkShape: RoundRangeSliderTickMarkShape(
                    tickMarkRadius: 13,
                  ),
                  rangeThumbShape: RoundRangeSliderThumbShape(
                    enabledThumbRadius: 16,
                    disabledThumbRadius: 13,
                  ),
                  disabledThumbColor: AppColors.veryLightGrey,
                  disabledActiveTrackColor: AppColors.veryLightGrey,
                  disabledInactiveTrackColor: AppColors.veryLightGrey,
                  secondaryActiveTrackColor: AppColors.gold,
                  showValueIndicator: ShowValueIndicator.never,
                ),
                extensions: <ThemeExtension>[
                  AppColorsTheme.light(),
                ],
              ),
              darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
                sliderTheme: SliderThemeData(
                  activeTrackColor: AppColors.gold,
                  thumbColor: AppColors.gold,
                  inactiveTrackColor: AppColors.veryLightGrey,
                  showValueIndicator: ShowValueIndicator.never,
                ),
                extensions: <ThemeExtension>[
                  AppColorsTheme.dark(),
                ],
              ),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                // TODO(truefalsemary): когда бек будет поддерживать, добавим
                // Locale('en'),
                Locale('ru'),
              ],
              locale: const Locale('ru'),
            ),
          ),
        ),
        // TODO(truefalsemary): Лен, тут надо красивенько сделать загрузочку
        // Например, кота рисовать крутящегося
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
