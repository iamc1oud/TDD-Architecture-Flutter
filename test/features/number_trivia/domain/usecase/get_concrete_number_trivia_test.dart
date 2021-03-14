import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import 'package:tdd_number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  /// Create this class under usecase folder in domain
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  /// This method runs before any other individual test
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: "Hello this is test", number: 1);

  test("should get trivia for the number from repository", () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(number: 1))
        .thenAnswer((_) async {
      return Right(tNumberTrivia);
    });

    // act
    final result = await usecase(Params(number: tNumber));

    // assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(number: tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
