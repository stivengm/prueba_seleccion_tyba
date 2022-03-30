import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:prueba_seleccion_tyba/gui/templates/menu_view.dart';
import 'package:prueba_seleccion_tyba/gui/views/home_view/home_view.dart';
import 'package:prueba_seleccion_tyba/gui/views/transactions_view/transactions_view.dart';

class ZoomDrawerApp extends StatefulWidget {
  const ZoomDrawerApp({ Key? key }) : super(key: key);

  @override
  State<ZoomDrawerApp> createState() => _ZoomDrawerAppState();
}

class _ZoomDrawerAppState extends State<ZoomDrawerApp> {

  MenuItemModel currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      borderRadius: 40.0,
      angle: 0.0,
      showShadow: true,
      slideWidth: MediaQuery.of(context).size.width * .6,
      backgroundColor: Colors.black26,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) {
          return MenuDrawerZoomView(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            }
          );
        }
      ),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomeView();
      case MenuItems.transactions:
        return const TransactionsView();
      default:
      return const HomeView();
    }
  }

}