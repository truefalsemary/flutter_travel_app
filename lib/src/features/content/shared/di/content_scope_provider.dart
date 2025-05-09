import 'package:flutter/widgets.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/features/content/shared/di/content_scope.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

class ContentScopeProvider extends StatefulWidget {
  final AppScope appScope;
  final Widget child;

  const ContentScopeProvider({
    required this.appScope,
    required this.child,
    super.key,
  });

  @override
  State<ContentScopeProvider> createState() => _ContentScopeProviderState();
}

class _ContentScopeProviderState extends State<ContentScopeProvider> {
  late final ContentScopeHolder _contentScopeHolder;

  @override
  void initState() {
    super.initState();
    _contentScopeHolder = ContentScopeHolder(widget.appScope);
    _contentScopeHolder.create();
  }

  @override
  Widget build(BuildContext context) {
    return ScopeProvider(
      holder: _contentScopeHolder,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _contentScopeHolder.drop();
    super.dispose();
  }
}
