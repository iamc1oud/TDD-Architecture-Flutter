import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';

/// Contract abstract class
abstract class NumberTriviaRepository {
  /// Left side argument is for error handling
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      {@required int number});
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
