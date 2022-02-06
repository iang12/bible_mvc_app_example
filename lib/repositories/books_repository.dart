import 'package:dio/dio.dart';
import 'package:mvc_flutter_app/models/book_model.dart';

class BooksRepository {
  final Dio dio;

  BooksRepository(this.dio);

  Future<List<BookModel>> getBooks() async {
    try {
      final response =
          await dio.get('https://www.abibliadigital.com.br/api/books/');

      return (response.data as List)
          .map((book) => BookModel.fromMap(book))
          .toList();
    } catch (e) {
      throw Exception('Erro ao buscar os livros da biblia.');
    }
  }
}

//https://www.abibliadigital.com.br/pt