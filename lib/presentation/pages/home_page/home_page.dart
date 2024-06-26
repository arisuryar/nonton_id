import 'package:flutter/material.dart';

import '../../../core/constant/assets.dart';
import '../../../core/constant/color.dart';
import '../../bloc/bloc.dart';
import '../../widgets/navbar_custom.dart';
import '../favorite_movie_page/favorite_movie_page.dart';
import '../movie_page/movie_page.dart';
import '../user_page/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavbar = 0;
  List itemNavbar = [
    {
      'title': 'Home',
      'icon': Assets.home,
      'selected': Assets.homeSelected,
      'page': const MoviePage(),
    },
    {
      'title': 'Favorite',
      'icon': Assets.watchlist,
      'selected': Assets.watchlistSelected,
      'page': const FavoriteMoviePage(),
    },
    {
      'title': 'Ticket',
      'icon': Assets.ticket,
      'selected': Assets.ticketSelected,
      'page': const Center(
        child: Text(
          'Ticket',
          style: TextStyle(color: white),
        ),
      ),
    },
    {
      'title': 'Akun',
      'icon': Assets.user,
      'selected': Assets.userSelected,
      'page': const UserPage(),
    },
  ];

  @override
  void initState() {
    final uid = context.read<LoginBloc>().state.uid;
    context.read<UserBloc>().add(OnGetUser(uid!));
    context.read<MovieBloc>().add(OnGetMovie());
    context.read<MovieBloc>().add(OnGetFavoriteMovie());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          itemNavbar[_selectedNavbar]['page'],
          NavbarCustom(
            itemNavbar: itemNavbar,
            selectedItem: _selectedNavbar,
            onTap: (index) => setState(() {
              _selectedNavbar = index;
            }),
          ),
        ],
      ),
    );
  }
}
