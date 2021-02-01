import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:old_wave_flutter/src/providedrs/Provider_Product.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  group('fetchProductosProvider', () {
    test('returns a jsonproduct if the http call completes successfully',
        () async {
      final client = MockClient();
      final itemToSearch = 'tv';

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
              'https://yurgqjbmwb.execute-api.us-east-2.amazonaws.com/dev/api/search/?q=$itemToSearch'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchProductosProvider(client), isA<Post>());
    });
  });
}
