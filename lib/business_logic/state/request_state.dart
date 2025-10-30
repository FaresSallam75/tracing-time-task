import 'package:equatable/equatable.dart';

class RequestState extends Equatable {
  const RequestState();
  @override
  List<Object?> get props => [];
}

class RequestInitialState extends RequestState {
  final bool isRefresh;
  const RequestInitialState({required this.isRefresh});
  @override
  List<Object?> get props => [isRefresh];
}

class RequestLoadingState extends RequestState {
  const RequestLoadingState();
  @override
  List<Object?> get props => [];
}

class RequestLoadedState extends RequestState {
  final List listRequestData;
  const RequestLoadedState({required this.listRequestData});
  @override
  List<Object?> get props => [listRequestData];
}

class RequestFailureState extends RequestState {
  final String errorMessage;
  const RequestFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
