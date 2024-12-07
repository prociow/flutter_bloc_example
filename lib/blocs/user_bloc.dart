import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    // Rejestrujemy obsługę wydarzeń
    on<FetchUsersEvent>(_onFetchUsers);
  }

  // Obsługa wydarzenia FetchUsersEvent
  Future<void> _onFetchUsers(FetchUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading()); // Emisja stanu ładowania
    try {
      // Symulowane pobieranie danych (API)
      await Future.delayed(Duration(seconds: 2));
      final users = List.generate(
        10,
            (index) => User(
          id: index,
          name: 'User $index',
          email: 'user$index@example.com',
        ),
      );
      emit(UserLoaded(users)); // Emisja stanu sukcesu z listą użytkowników
    } catch (e) {
      emit(UserError('Failed to fetch users')); // Emisja stanu błędu
    }
  }
}
