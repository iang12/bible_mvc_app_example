import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mvc_flutter_app/controllers/books_controller.dart';
import 'package:mvc_flutter_app/repositories/books_repository.dart';

class BooksBiblePage extends StatefulWidget {
  const BooksBiblePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BooksBiblePage> createState() => _BooksBiblePageState();
}

class _BooksBiblePageState extends State<BooksBiblePage> {
  late BooksController booksController;
  @override
  void initState() {
    booksController = BooksController(BooksRepository(Dio()));
    booksController.getBooksBible();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        builder: (_, widget) {
          return booksController.books.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: booksController.books.length,
                  itemBuilder: (_, index) {
                    var book = booksController.books[index];
                    return ListTile(
                      leading: const Icon(Icons.book_rounded),
                      title: Text(book.name),
                      subtitle: Text(
                        'Nº capitulos: ${book.chapters}',
                      ),
                    );
                  },
                );
        },
        animation: booksController,
      ),
    );
  }
}
