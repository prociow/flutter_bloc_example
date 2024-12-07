import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user_bloc.dart';
import '../blocs/user_event.dart';
import '../blocs/user_state.dart';

class UserScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('User List')),
    body: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return Center(
            child: Text('Press the button to fetch users'),
          );
        } else if (state is UserLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoaded) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        } else if (state is UserError) {
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        context.read<UserBloc>().add(FetchUsersEvent()); // Use the existing bloc
      },
      child: Icon(Icons.download),
    ),
  );
}
}
