import 'package:equatable/equatable.dart';

// Event to akcja użytkownika, np. kliknięcie przycisku pobierania danych
abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUsersEvent extends UserEvent {} // Wydarzenie: Pobierz użytkowników