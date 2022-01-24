import 'dart:convert';

class CardModel {
  String title;
  String content;
  DateTime submitDate;
  DateTime addedDate;
  CardModel({
    required this.title,
    required this.content,
    required this.submitDate,
    required this.addedDate,
  });

  CardModel copyWith({
    String? title,
    String? content,
    DateTime? submitDate,
    DateTime? addedDate,
  }) {
    return CardModel(
      title: title ?? this.title,
      content: content ?? this.content,
      submitDate: submitDate ?? this.submitDate,
      addedDate: addedDate ?? this.addedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'submitDate': submitDate.millisecondsSinceEpoch,
      'addedDate': addedDate.millisecondsSinceEpoch,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      title: map['title'],
      content: map['content'],
      submitDate: DateTime.fromMillisecondsSinceEpoch(map['submitDate']),
      addedDate: DateTime.fromMillisecondsSinceEpoch(map['addedDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CardModel(title: $title, content: $content, submitDate: $submitDate, addedDate: $addedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardModel &&
        other.title == title &&
        other.content == content &&
        other.submitDate == submitDate &&
        other.addedDate == addedDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        content.hashCode ^
        submitDate.hashCode ^
        addedDate.hashCode;
  }
}
