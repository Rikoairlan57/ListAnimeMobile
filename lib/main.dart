import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:listanime/providers/anime_provider.dart';
import 'package:listanime/providers/auth_provider.dart';
import 'package:listanime/providers/search_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listanime/screens/home_screen.dart';
import 'package:listanime/screens/login_screen.dart';
import 'package:listanime/screens/profile.dart';
import 'package:listanime/screens/top_anime.dart';
import 'providers/favorite_provider.dart';
import 'screens/register_screen.dart';
import 'package:provider/provider.dart';

import 'screens/search_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => AuthProvider())),
    ChangeNotifierProvider(create: ((context) => AnimeProvider())),
    ChangeNotifierProvider(create: ((context) => FavoriteProvider())),
    ChangeNotifierProvider(create: ((context) => SearchProvider()))
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Anime',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Colors.black, secondary: Colors.grey[900]),
        fontFamily: GoogleFonts.josefinSans().fontFamily,
      ),
      home: StreamBuilder(
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return LoginScreen();
          }),
          stream: FirebaseAuth.instance.authStateChanges()),
      routes: {
        '/search-screen': (context) => const SearchScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': ((context) => Profile()),
        '/top-anime': ((context) => TopAnime())
      },
    );
  }
}
