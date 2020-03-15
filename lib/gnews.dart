import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:storyexample/repository.dart';
import 'package:storyexample/widgets.dart';

class GnewsView extends StatelessWidget {
  final StoryController controller = StoryController();
  // story view here
  Widget _buildHighlights(List<Highlight> highlights) {
    final stories = highlights.map<StoryItem>((it) {
      return StoryItem.inlineGif(
        it.image,
        caption: Text(
          it.headline,
          style: TextStyle(
            backgroundColor: Colors.black54,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        controller: controller,
        roundedTop: true,
      );
    }).toList();

    return StoryView(
      stories,
      repeat: true,
      inline: true,
      progressPosition: ProgressPosition.bottom,
      controller: controller,
    );
  }

  Widget _buildCoverageButton() {
    return Builder(
      builder: (context) {
        return Material(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(8))),
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "View full coverage",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExtra() {
    return ListTile(
      leading: Text("1"),
      title: Text(
        "Galaxy S20 Ultra teardown video shows superior periscope zoom",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Text(
            "2 days ago • TechCatch.org",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildExtra2() {
    return ListTile(
      leading: Text("2"),
      title: Text(
        "Bill Gates steps down from Microsoft board, and others",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Text(
            "2 days ago • WindoorsInsider",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNews(Gnews news) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.book,
              color: Colors.blue,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    news.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Bloobegg News",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 250,
          child: _buildHighlights(news.highlights),
        ),
        _buildCoverageButton(),
        SizedBox(
          height: 16,
        ),
        _buildExtra(),
        SizedBox(
          height: 16,
        ),
        _buildExtra2(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Google News",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildNews(snapshot.data);
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
        future: Repository.getNews(),
      ),
    );
  }
}
