class StreamModel {
  int? id;
  String stream;

  StreamModel({
    this.id,
    required this.stream,
  });

  factory StreamModel.fromMap({required Map data}) {
    return StreamModel(
      id: data['id'],
      stream: data['stream'],
    );
  }
}
