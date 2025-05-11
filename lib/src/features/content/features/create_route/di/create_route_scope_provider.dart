import 'package:flutter/widgets.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/di/create_route_scope.dart';
import 'package:flutter_travel_app/src/features/content/shared/di/content_scope.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

class CreateRouteScopeProvider extends StatefulWidget {
  final ContentScopeContainer contentScope;
  final Widget child;

  const CreateRouteScopeProvider({
    required this.contentScope,
    required this.child,
    super.key,
  });

  @override
  State<CreateRouteScopeProvider> createState() =>
      _CreateRouteScopeProviderState();
}

class _CreateRouteScopeProviderState extends State<CreateRouteScopeProvider> {
  late final CreateRouteScopeHolder _createRouteScopeHolder;

  @override
  void initState() {
    super.initState();
    _createRouteScopeHolder = CreateRouteScopeHolder(widget.contentScope);
    _createRouteScopeHolder.create();
  }

  @override
  Widget build(BuildContext context) {
    return ScopeProvider(
      holder: _createRouteScopeHolder,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _createRouteScopeHolder.drop();
    super.dispose();
  }
}
