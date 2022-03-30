import 'package:flutter/material.dart';
import 'package:prueba_seleccion_tyba/gui/widgets/primary_button.dart';

class MenuItemModel {
  final String title;
  final IconData icon;
  const MenuItemModel(this.title, this.icon);
}

class MenuItems {
  static const home = MenuItemModel('Inicio', Icons.home_outlined);
  static const transactions = MenuItemModel('Transacciones', Icons.account_balance_wallet_outlined);

  static const all = <MenuItemModel>[
    home,
    transactions
  ];

}

class MenuDrawerZoomView extends StatefulWidget {
  final MenuItemModel currentItem;
  final ValueChanged<MenuItemModel> onSelectedItem;

  const MenuDrawerZoomView({ 
    Key? key,
    required this.currentItem,
    required this.onSelectedItem
  }) : super(key: key);

  @override
  State<MenuDrawerZoomView> createState() => _MenuDrawerZoomViewState();
}

class _MenuDrawerZoomViewState extends State<MenuDrawerZoomView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF4B5669),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          width: size.width * .5,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ...MenuItems.all.map(buildMenuItem).toList()
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: PrimaryButton(
                  text: 'Cerrar sesión',
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false),
                ),
              ),
              const SizedBox(height: 15.0)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItemModel item) {
    return ListTileTheme(
      selectedColor: Colors.black,
      child: ListTile(
        selectedColor: Colors.black,
        selected: widget.currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(item.title, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white)),
        onTap: () => widget.onSelectedItem(item),
      ),
    );
  }
}