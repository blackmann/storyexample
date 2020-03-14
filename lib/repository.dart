enum MediaType { image, video, text }

class WhatsappStory {
  final MediaType mediaType;
  final String media;
  final double duration;
  final String caption;
  final String when;

  WhatsappStory({
    this.mediaType,
    this.media,
    this.duration,
    this.caption,
    this.when,
  });
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

  Future<Gnews> getNews() async {
    return null;
  }
}
