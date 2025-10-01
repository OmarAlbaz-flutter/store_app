class RatingModel {
  final num rate;
  final num count;
  RatingModel({
    required this.count,
    required this.rate,
  });

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      count: jsonData['count'],
      rate: jsonData['rate'],
    );
  }
}
