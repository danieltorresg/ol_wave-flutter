import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:old_wave_flutter/src/providedrs/Provider_Product.dart';
import 'package:old_wave_flutter/src/providedrs/Provaider_Product_Detail.dart';
//import 'package:test/test.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  // Test about products
  group('fetchProductosProvider', () {
    final itemToSearch = 'tv';

    // Test product from Nodejs API
    test(
        'returns a jsonproduct if the http call completes successfully from Node',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
              'https://yurgqjbmwb.execute-api.us-east-2.amazonaws.com/dev/api/search/?q=$itemToSearch'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchProductosProvider(client), isA<Post>());
    });

    //Test product from Django API
    test(
        'returns a jsonproduct if the http call completes successfully from Django',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
              'http://development.eba-2veq4gdy.us-west-2.elasticbeanstalk.com/django_api/search/?q=$itemToSearch'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchProductosProvider(client), isA<Post>());
    });

    // Test product from .NET API
    test('returns a jsonproduct if the http call completes successfully .NET',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
              'http://blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.com/api/search?q=$itemToSearch'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchProductosProvider(client), isA<Post>());
    });
  });

  // Test about product detail
  group('fetchProductDetailProvider', () {
    final idProduct = '1';

    // Test product detail from Django API
    test(
        'returns a jsonproduct if the http call completes successfully from Django',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
              'http://production.eba-2veq4gdy.us-west-2.elasticbeanstalk.com/django_api/item/$idProduct'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchProductDetailProvider(client), isA<PostD>());
    });

    // Test product detail from .NET API
    test('returns a jsonproduct if the http call completes successfully .NET',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
              'http://blackstorenetcore.eba-py2kgy33.us-east-1.elasticbeanstalk.com/api/item/$idProduct'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchProductosProvider(client), isA<PostD>());
    });

    // Test product detail from Nodejs API
    test(
        'returns a jsonproduct if the http call completes successfully from Nodejs',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
              'https://yurgqjbmwb.execute-api.us-east-2.amazonaws.com/dev/api/item/$idProduct'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchProductosProvider(client), isA<PostD>());
    });
  });
}
