import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import '../providers/anime_provider.dart';
import '../providers/search_provider.dart';
import '../widgets/custom_progress_indicator.dart';
import '../widgets/drawer.dart';
import '../widgets/favorite.dart';
import '../widgets/recommended.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _selectedPage = 0;
  static const List<Widget> _page = [
    Recommended(),
    FavoriteScreen(),
  ];
  late Future data;
  final user = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    data = Future.wait([
      Provider.of<FavoriteProvider>(context, listen: false).getDatabase(),
      Provider.of<AnimeProvider>(context, listen: false).fetchData(),
      FirebaseFirestore.instance.collection('users').doc(user).get()
    ]);
  }

  void _changePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: data,
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CustomProgressIndicator(color: Colors.white))
            : Scaffold(
                floatingActionButton: _selectedPage == 1
                    ? FloatingActionButton(
                        backgroundColor: Colors.red,
                        onPressed: () => Provider.of<FavoriteProvider>(context,
                                listen: false)
                            .reverseList,
                        child: Icon(Icons.sort),
                      )
                    : null,
                drawer: AppDrawer(
                    imageurl: snapshot.data[2]['imageurl'],
                    name: snapshot.data[2]['name']),
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.black,
                  title: const Text('GoNime'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/search-screen').then(
                                (value) => Provider.of<SearchProvider>(context,
                                        listen: false)
                                    .title_removed()),
                        icon: const Icon(
                          Icons.search,
                          size: 26,
                        ),
                      ),
                    )
                  ],
                ),
                body: _page[_selectedPage],
                bottomNavigationBar: SizedBox(
                  height: 70,
                  child: BottomNavigationBar(
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    unselectedFontSize: 10,
                    selectedFontSize: 10,
                    currentIndex: _selectedPage,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite), label: 'Favorite'),
                    ],
                    onTap: (value) => _changePage(value),
                  ),
                ),
              ),
      ),
    );
  }
}
