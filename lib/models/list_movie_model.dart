class SingleMoiveModel {
  final String year, title, description, runTime, imageUrl, rating;
  final List genres;
  final int id;
  List<SingleTorrentModel> _torrents = [];
  List<SingleTorrentModel> get torrents => _torrents;

  SingleMoiveModel(
      {required this.year,
      required this.description,
      required this.genres,
      required this.imageUrl,
      required this.rating,
      required this.runTime,
      required this.title,
      required List torrents,
      required this.id}) {
    List<SingleTorrentModel> tempList = [];
    for (var each in torrents) {
      try {
        tempList.add(SingleTorrentModel(
            quality: each['quality'],
            size: each['size'],
            downloadUrl: each['url']));
      } catch (e) {}
    }
    _torrents = tempList;
  }
}

class SingleTorrentModel {
  final String quality, size, downloadUrl;
  SingleTorrentModel(
      {required this.quality, required this.size, required this.downloadUrl});
}
