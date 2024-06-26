class BookModel {
  final String author;
  final int chapters;

  final String name;

  BookModel({
    required this.author,
    required this.chapters,
    required this.name,
  });

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      author: map['author'] ?? '',
      chapters: _getNumberChapters(map),
      name: map['name'] ?? '',
    );
  }
  static int _getNumberChapters(Map<String, dynamic> data) {
    final chapters = data['chapters'] as List;

    return chapters.length;
  }
}
