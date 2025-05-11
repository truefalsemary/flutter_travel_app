import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_route_event.dart';
part 'create_route_state.dart';

class CreateRouteBloc extends Bloc<CreateRouteEvent, CreateRouteState> {
  CreateRouteBloc() : super(CreateRouteInitial());
}
