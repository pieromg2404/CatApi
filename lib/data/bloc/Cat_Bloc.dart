import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/model/CatBreed.dart';
import 'package:flutter_application_1/data/repository/CatRepository.dart';

part 'Cat_State.dart';
part 'CatEvent.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository _repository;
  CatBloc({
    required CatRepository repository,
  })  : _repository = repository,
        super(CatState.initial()) {
    on<FetchCats>(_mapeventtostate);
  }

  void _mapeventtostate(FetchCats event, Emitter<CatState> emit) async {
    emit(state.copywith(catbreed: [], load: true, error: false));
    try {
      final cats = await _repository.fetchCatBreeds(event.breedId!);
      emit(state.copywith(catbreed: cats, load: false, error: false));
    } catch (e) {
      emit(state.copywith(catbreed: [], load: false, error: true,message: e.toString()));
    }
  }
}
