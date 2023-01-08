import 'package:equatable/equatable.dart';
import 'package:project/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialStates extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WlcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  List<Object> get props => [place];
}
