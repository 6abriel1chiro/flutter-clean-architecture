import 'package:flutter_application_clean/application/user/user_event.dart';
import 'package:flutter_application_clean/application/user/user_state.dart';
import 'package:flutter_application_clean/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitialState()) {
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepository.fetchUser(event.username);
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
