import 'package:dio/dio.dart';
import 'package:mvc_flutter_app/models/book_model.dart';

class BooksRepository {
  final Dio dio;

  BooksRepository(this.dio);

  Future<List<BookModel>> getBibleBooks() async {
    try {
      final response =
          await dio.get(
        'https://api.scripture.api.bible/v1/bibles/90799bb5b996fddc-01/books',
        options: Options(
          headers: {
            'api-key': 'put your api here',
          },
        ),
        queryParameters: {
          'include-chapters': true,
        },
      );

      return (response.data['data'] as List)
          .map((book) => BookModel.fromMap(book))
          .toList();

      
    } catch (e) {
      throw Exception('Erro ao buscar os livros da biblia.');
    }
  }
}
//new API : https://api.scripture.api.bible/
//old API : https://www.abibliadigital.com.br/pt