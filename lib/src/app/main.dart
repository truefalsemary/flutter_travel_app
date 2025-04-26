import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
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
      // Scope-виджеты поддерживают работу со Scope-интерфейсами.
      child: ScopeBuilder<AppScopeContainer>.withPlaceholder(
        builder: (context, appScope) {
          return MaterialApp.router(
            title: 'Hello',
            routerConfig: appScope.routerDelegate,
          );
        },
        // Этот виджет будет отображаться, пока [appScopeHolder] инициализируется
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
