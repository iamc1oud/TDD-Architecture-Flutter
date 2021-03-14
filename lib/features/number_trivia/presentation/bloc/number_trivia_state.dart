part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  NumberTriviaState();
}

class NumberTriviaInitial extends NumberTriviaState {
  @override
  List<Object> get props => [];
}
