import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_number_trivia/core/platform/network_info.dart';
import 'package:tdd_number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:tdd_number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:tdd_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:tdd_number_trivia/features/number_trivia/data/repositories/number_tirivia_repository_impl.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl numberTriviaRepositoryImpl;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    numberTriviaRepositoryImpl = NumberTriviaRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  group("getConcreteNumberTrivia", () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel(number: tNumber, text: "Hello");
    test("should check if device is online", () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      numberTriviaRepositoryImpl.getConcreteNumberTrivia(number: tNumber);

      verify(mockNetworkInfo.isConnected);
    });

    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });

      test(
          "should return remote data when the call to remote data source is successful",
          () async {
        when(mockRemoteDataSource.getConcreteNumberTrivia(any))
            .thenAnswer((realInvocation) async => tNumberTriviaModel);
      });
    });

    group("device is offline", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
    });
  });
}
