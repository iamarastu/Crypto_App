import 'package:flutter/material.dart';

class QRpage extends StatelessWidget {
  final int selectedOption;

  const QRpage({Key? key, required this.selectedOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              'assets/images/QR.jpeg', 
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 15,),

            Text('You have to Pay: $selectedOption RS',
        style: const TextStyle(color: Colors.white),),
          ],
        )
      ),
    );
  }
}