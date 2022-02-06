import 'package:flutter/material.dart';
import 'package:mvc_flutter_app/models/book_model.dart';
import 'package:mvc_flutter_app/repositories/books_repository.dart';

class BooksController extends ChangeNotifier {
  final BooksRepository repository;

  BooksController(this.repository);

  List<BookModel> books = [];
  getBooksBible() async {
    books = await repository.getBooks();
    notifyListeners();
  }
}
