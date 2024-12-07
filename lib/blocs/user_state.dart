import 'package:equatable/equatable.dart';
import '../models/user.dart';

// State reprezentuje różne stany aplikacji
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

// Stan początkowy
class UserInitial extends UserState {}

// Stan ładowania
class UserLoading extends UserState {}

// Stan sukcesu z listą użytkowników
class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded(this.users);

  @override
  List<Object> get props => [users];
}

// Stan błędu
class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => [message];
}