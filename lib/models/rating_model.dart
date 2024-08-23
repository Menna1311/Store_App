class Rating {
  final dynamic rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });
  factory Rating.fromJson(json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
