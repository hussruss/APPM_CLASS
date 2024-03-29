class Note {
  int id;
  String title;
  String content;

  Note({required this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() => {'title': title, 'content': content};

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(id: map['id'], title: map['title'], content: map['content']);
  }
}
