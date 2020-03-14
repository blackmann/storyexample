enum MediaType { image, video }

class WhatsappStory {
  final MediaType mediaType;
  final String media;
  final double duration;
  final String caption;

  WhatsappStory({this.mediaType, this.media, this.duration, this.caption});
}

class Highlight {
  final String image;
  final String headline;

  Highlight({this.image, this.headline});
}

class Gnews {
  final String title;
  final List<Highlight> highlights;

  Gnews({this.title, this.highlights});
}

class Repository {
  Future<List<WhatsappStory>> getWhatsappStories() async {
    return [];
  }

  Future<List<Gnews>> getNews() async {
    return [];
  }
}
