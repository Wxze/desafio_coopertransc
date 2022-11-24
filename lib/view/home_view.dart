// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'my_trip_view.dart';
import 'trip_view.dart';
import 'turn_view.dart';
import 'warning_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _AppBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String currentScreenTitle;
  final Function changePageIndex;

  const _AppBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.currentScreenTitle,
    required this.changePageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => changePageIndex(),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
              border: label == currentScreenTitle
                  ? Border(
                      top: BorderSide(
                          color: Color(0xFFf9d661).withAlpha(227), width: 2.0))
                  : Border(
                      top: BorderSide(color: Colors.transparent, width: 2.0))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              color: label == currentScreenTitle
                  ? Color(0xFFf9d661).withAlpha(227)
                  : Colors.white.withOpacity(0.85),
            ),
            Center(
              child: Text(
                label,
                style: TextStyle(
                    color: label == currentScreenTitle
                        ? Color(0xFFf9d661).withAlpha(227)
                        : Colors.white.withOpacity(0.85)),
              ),
            )
          ]),
        ));
  }
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  String _appBarTitle = 'Vez';

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
      changeAppBarTitle();
    });
  }

  final List<Widget> _screens = [
    TurnView(),
    TripView(),
    MyTripView(),
    WarningView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle,
            style: TextStyle(
              fontSize: 16,
            )),
        leading: leadingIcon(),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: handleClick,
            itemBuilder: (context) {
              return {'Meu perfil', 'Sair'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF316762),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 65,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _AppBarItem(
                      icon: Icons.local_shipping,
                      label: "Vez",
                      currentScreenTitle: _appBarTitle,
                      changePageIndex: () {
                        changeIndex(0);
                      }),
                  _AppBarItem(
                      icon: Icons.group,
                      label: "Viagens",
                      currentScreenTitle: _appBarTitle,
                      changePageIndex: () {
                        changeIndex(1);
                      }),
                  _AppBarItem(
                      icon: Icons.person,
                      label: "Minhas viagens",
                      currentScreenTitle: _appBarTitle,
                      changePageIndex: () {
                        changeIndex(2);
                      }),
                  _AppBarItem(
                      icon: Icons.warning,
                      label: "Avisos",
                      currentScreenTitle: _appBarTitle,
                      changePageIndex: () {
                        changeIndex(3);
                      }),
                ]),
          ),
        ),
      ),
    );
  }

  void changeAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        _appBarTitle = 'Vez';
        break;
      case 1:
        _appBarTitle = 'Viagens';
        break;
      case 2:
        _appBarTitle = 'Minhas viagens';
        break;
      case 3:
        _appBarTitle = 'Avisos';
        break;
    }
  }

  leadingIcon() {
    switch (_currentIndex) {
      case 0:
        return Icon(Icons.local_shipping);
      case 1:
        return Icon(Icons.group);
      case 2:
        return Icon(Icons.person);
      case 3:
        return Icon(Icons.warning);
    }
  }

  void handleClick(String value) {
    switch (value) {
      case 'Sair':
        Navigator.pushNamed(context, '/login');
        break;
      case 'Meu perfil':
        Navigator.pushNamed(context, '/user');
    }
  }
}
