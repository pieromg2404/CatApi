part of 'Cat_Bloc.dart';

class CatState {
  final List<CatBreed> catbreed;
  final bool error;
  final bool load;
  final String message;

  const CatState(
      {this.catbreed = const [],
      this.error = false,
      this.load = false,
      this.message = ""});

  const CatState._(
      {this.catbreed = const [],
      this.error = false,
      this.load = false,
      this.message = ""});

  CatState.initial()
      : this._(catbreed: [], error: false, load: false, message: "");

  CatState copywith(
      {List<CatBreed>? catbreed, bool? error, bool? load, String? message}) {
    return CatState(
        catbreed: catbreed ?? this.catbreed,
        error: error ?? this.error,
        load: load ?? this.load,
        message: message ?? this.message);
  }

  List<Object> get props => [catbreed, load];
}
