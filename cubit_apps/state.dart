abstract class NewsState {}

class InitlApps extends NewsState {}

class ChangeBottemPar extends NewsState {}

class GetBussinceLoading extends NewsState {}

class GetBussinceDatag extends NewsState {}

class GetBussinceErrors extends NewsState {
  final dynamic errors;

  GetBussinceErrors(this.errors);
}

class GetSportsLoading extends NewsState {}

class GetSportsDatag extends NewsState {}

class GetSportsErrors extends NewsState {
  final dynamic errors;

  GetSportsErrors(this.errors);
}

class GetScienceLoading extends NewsState {}

class GetScienceDatag extends NewsState {}

class GetScienceErrors extends NewsState {
  final dynamic errors;

  GetScienceErrors(this.errors);
}

class GetBussincesuccess extends NewsState {}

class GetSportssuccess extends NewsState {}

class GetScincesuccess extends NewsState {}

class ChingeModeApps extends NewsState {}

class GetSearchLoading extends NewsState {}

class GetSearchSuccess extends NewsState {}

class GetSearchErrors extends NewsState {
  final dynamic errors;

  GetSearchErrors(this.errors);
}
