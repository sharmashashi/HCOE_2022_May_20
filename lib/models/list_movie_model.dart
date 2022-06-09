class SingleMoiveModel {
  final String year, title, description, runTime, imageUrl, rating;
  final List genres;
  final int id;

  SingleMoiveModel(
      {required this.year,
      required this.description,
      required this.genres,
      required this.imageUrl,
      required this.rating,
      required this.runTime,
      required this.title,
      required this.id
      });
}
