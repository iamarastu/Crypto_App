import 'package:crypto_app/features/HomeTab/QR/QRpage.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<int> options = [500, 1499, 3900];
  bool isDropdownOpen = false;
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Hi Aniket!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                
                ElevatedButton(
                  onPressed: () {
                    _showDropdown(context);
                  },
                  child: const Text("Add Money"),
                ),
                if (selectedOption != null)
                  Text('Selected Option: $selectedOption'),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options.map((option) {
              return ListTile(
                title: Text('$option'),
                onTap: () {
                  _navigateToSamePage(context, option);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _navigateToSamePage(BuildContext context, int option) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QRpage(selectedOption: option),
      ),
    );
  }
}