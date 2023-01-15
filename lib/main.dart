import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Staggered Gridd View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Basic", icon: Icon(Icons.directions_car)),
              Tab(text: "Staggered", icon: Icon(Icons.directions_transit)),
              Tab(text: "Dynamic", icon: Icon(Icons.directions_transit)),
              Tab(text: "Sliver", icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GridV(),
            Staggered(),
            GridV(),
            Staggered(),
          ],
        ),
      ),
    );
  }
}

//Basic
class GridV extends StatelessWidget {
  const GridV({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => buildImageCard(index));
  }
}

class Staggered extends StatelessWidget {
  const Staggered({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      scrollDirection: Axis.horizontal,
          staggeredTileBuilder: (index) => StaggeredTile.count(index <= 0 ? 4 : 2, 2),
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
       
        itemCount: 6,
        itemBuilder: (context, index) => buildImageCard(index));
  }
}

Widget buildImageCard(int index) {
  return Card(
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Container(
      margin: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          "https://source.unsplash.com/random?sig=$index",
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
