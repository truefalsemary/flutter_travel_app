import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_travel_app/resources/resources.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_layout_notifier.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_text_field.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/common/utils/named_logger_factory.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/di/create_route_scope.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/di/create_route_scope_provider.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_point_form/create_point_form_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/create_points_form_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/create_points_form_state.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/models/create_point_form_model.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_route_form/create_route_form_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_route_form/create_route_form_state.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/place_location_selection_map_page.dart';
import 'package:flutter_travel_app/src/features/content/shared/di/content_scope.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/ui/widgets/image_xfile_carousel.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart'
    as proto;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

part 'widgets/add_point_page.dart';
part 'widgets/points_form_page.dart';
part 'widgets/points_item_height_notifier.dart';
part 'widgets/route_form_page.dart';

typedef OnNextPagePressed = void Function();

class CreateRoutePage extends StatelessWidget {
  const CreateRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopeBuilder<ContentScopeContainer>.withPlaceholder(
      builder: (context, scope) => CreateRouteScopeProvider(
        contentScope: scope,
        child: const _CreateRouteView(),
      ),
    );
  }
}

class _CreateRouteView extends StatelessWidget {
  const _CreateRouteView();

  @override
  Widget build(BuildContext context) {
    return ScopeBuilder<CreateRouteScopeContainer>.withPlaceholder(
      builder: (context, scope) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => scope.createRouteFormBloc,
          ),
          BlocProvider(
            create: (context) => scope.createPointsFormBloc,
          ),
        ],
        child: const Scaffold(
          body: _CreateRoutePageView(),
        ),
      ),
    );
  }
}

class _CreateRoutePageView extends StatefulWidget {
  const _CreateRoutePageView();

  @override
  State<_CreateRoutePageView> createState() => _CreateRoutePageViewState();
}

class _CreateRoutePageViewState extends State<_CreateRoutePageView>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.mainBg,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageViewController,
        onPageChanged: _handlePageViewChanged,
        children: [
          _RouteFormPage(
            onNextPagePressed: () => _updateCurrentPageIndex(1),
          ),
          _PointsFormPage(
            onBackPressed: () => _updateCurrentPageIndex(0),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
