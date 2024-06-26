part of 'Cat_Bloc.dart';

class CatEvent {
  const CatEvent();

    @override
  List<Object> get props => [];
}

class FetchCats extends CatEvent {
  final String? breedId;
  FetchCats({this.breedId});
}
