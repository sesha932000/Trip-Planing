import 'package:bloc/bloc.dart';
import 'package:project/cubit/app_cubit_states.dart';
import 'package:project/model/data_model.dart';
import 'package:project/pages/details_page.dart';
import 'package:project/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialStates()) {
    emit(WlcomeState());
  }
  final DataServices data;
  late final places;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
