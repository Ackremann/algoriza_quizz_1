import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitial());
}
