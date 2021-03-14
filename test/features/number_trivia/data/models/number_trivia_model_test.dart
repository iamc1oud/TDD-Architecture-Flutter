import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: "Hello world");
  final tNumberTriviaModelDouble = NumberTriviaModel(number: 1, text: "Hello");
  test("should be a subclass of NumberTrivia entitiy", () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  // Group
  group("fromJson", () {
    test("should return valid model when json number is integer", () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture("trivia.json"));
      final result = NumberTriviaModel.fromJson(jsonMap);
      // act
      expect(result, tNumberTriviaModel);
    });

    test("should return valid model when json number is double", () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture("trivia_double.json"));
      final result = NumberTriviaModel.fromJson(jsonMap);
      // act
      expect(result, tNumberTriviaModelDouble);
    });
  });

  group('toJson', () {
    test("should return a valid number trivia json map", () async {
      final result = tNumberTriviaModel.toJson();
      final expectedMap = {"text": "Hello world", "number": 1};
      expect(expectedMap, result);
    });
  });
}
