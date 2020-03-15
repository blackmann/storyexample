import 'package:flutter/material.dart';
import 'package:storyexample/repository.dart';
import 'package:story_view/story_view.dart';
import 'package:storyexample/util.dart';
import 'package:storyexample/widgets.dart';

class Whatsapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StoryViewDelegate(
              stories: snapshot.data,
            );
          }

          if (snapshot.hasError) {
            return ErrorView();
          }

          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        },
        future: Repository.getWhatsappStories(),
      ),
    );
  }
}

class StoryViewDelegate extends StatefulWidget {
  final List<WhatsappStory> stories;

  StoryViewDelegate({this.stories});

  @override
  _StoryViewDelegateState createState() => _StoryViewDelegateState();
}

class _StoryViewDelegateState extends State<StoryViewDelegate> {
  final StoryController controller = StoryController();
  List<StoryItem> storyItems = [];

  @override
  void initState() {
    super.initState();
    widget.stories.forEach((story) {
      if (story.mediaType == MediaType.text) {
        storyItems.add(
          StoryItem.text(
            story.caption,
            HexColor(story.color),
            duration: Duration(
              milliseconds: (story.duration * 1000).toInt(),
            ),
          ),
        );
      }

      if (story.mediaType == MediaType.image) {
        storyItems.add(StoryItem.pageGif(
          story.media,
          controller: controller,
          caption: story.caption,
          duration: Duration(
            milliseconds: (story.duration * 1000).toInt(),
          ),
        ));
      }

      if (story.mediaType == MediaType.video) {
        storyItems.add(
          StoryItem.pageVideo(
            story.media,
            controller: controller,
            duration: Duration(milliseconds: (story.duration * 1000).toInt()),
            caption: story.caption,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems,
      controller: controller,
      onComplete: () {
        Navigator.of(context).pop();
      },
    );
  }
}
