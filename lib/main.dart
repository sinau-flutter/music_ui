import 'package:flutter/material.dart';

void main() => runApp(MyApp());

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF7D9AFF), accentColor: Color(0xFF7D9AFF)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Song> listSong = List();

  @override
  void initState() {
    initListSong();
    super.initState();
  }

  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      key: scaffoldState,
      body: Stack(
        children: <Widget>[
          _buildWidgetAlbumCover(mediaQuery),
          _buildWidgetActionAppBar(mediaQuery),
          _buildWidgetArtistName(mediaQuery),
          _buildWidgetFloatingActionButton(mediaQuery),
          _buildWidgetListSong(mediaQuery)
        ],
      ),
    );
  }

  Widget _buildWidgetAlbumCover(MediaQueryData mediaQuery) {
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height / 1.7,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(48.0)),
          image: DecorationImage(
              image: AssetImage('assets/clairo-bubble.jpg'),
              fit: BoxFit.cover)),
    );
  }

  Widget _buildWidgetActionAppBar(MediaQueryData mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.0, top: mediaQuery.padding.top + 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          Icon(
            Icons.info_outline,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildWidgetArtistName(MediaQueryData mediaQuery) {
    return SizedBox(
      height: mediaQuery.size.height / 1.7,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints contrains) {
            return Stack(
              children: <Widget>[
                Positioned(
                  child: Text(
                    'Cottrill',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'CoralPen',
                        fontSize: 72.0),
                  ),
                  top: contrains.maxHeight - 100,
                ),
                Positioned(
                  child: Text(
                    'Clairo',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'CoralPen',
                        fontSize: 72.0),
                  ),
                  top: contrains.maxHeight - 160,
                ),
                Positioned(
                  child: Text(
                    'Trending',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontFamily: 'Campton_Light',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800),
                  ),
                  top: contrains.maxHeight - 175,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildWidgetFloatingActionButton(MediaQueryData mediaQuery) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
          padding: EdgeInsets.only(
              top: mediaQuery.size.height / 1.7 - 32.0, right: 32.0),
          child: FloatingActionButton(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            backgroundColor: Colors.cyan,
            onPressed: () {
              // Nanti di arahkan ke halaman baru
            },
          )),
    );
  }

  Widget _buildWidgetHeaderSong() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Popular',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
              fontFamily: 'Campton_Light'),
        ),
        Text(
          'Show all',
          style: TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.w600,
              fontFamily: 'Campton_Light'),
        )
      ],
    );
  }

  Widget _buildWidgetListSong(MediaQueryData mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        top: mediaQuery.size.height / 1.8 + 48.0,
        right: 20.0,
        bottom: mediaQuery.padding.bottom + 20.0,
      ),
      child: Column(
        children: <Widget>[
          _buildWidgetHeaderSong(),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                Song song = listSong[index];
                print(song);
                return GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          song.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Campton_Light',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        song.duration,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 24.0),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              itemCount: listSong.length,
            ),
          ),
        ],
      ),
    );
  }

  void initListSong() {
    listSong.add(Song(title: 'Pretty Girl', duration: '2:58'));
    listSong.add(Song(title: 'Flamming Hot Cheetos', duration: '2:03'));
    listSong.add(Song(title: '4EVER', duration: '2:39'));
    listSong.add(Song(title: 'Bubble Gum', duration: '2:55'));
    listSong.add(Song(title: 'Softly', duration: '3:05'));
    listSong.add(Song(title: 'Closer To You', duration: '3:04'));
    listSong.add(Song(title: 'Drown', duration: '3:54'));
  }
}

class Song {
  String title;
  String duration;

  Song({this.title, this.duration});

  @override
  String toString() {
    return 'Song{title: $title, duration: $duration}';
  }
}
