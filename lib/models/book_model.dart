class BookModel {
  final String author;
  final int chapters;
  final String group;
  final String name;
  final String testament;
  BookModel({
    required this.author,
    required this.chapters,
    required this.group,
    required this.name,
    required this.testament,
  });

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      author: map['author'] ?? '',
      chapters: map['chapters']?.toInt() ?? 0,
      group: map['group'] ?? '',
      name: map['name'] ?? '',
      testament: map['testament'] ?? '',
    );
  }
}
