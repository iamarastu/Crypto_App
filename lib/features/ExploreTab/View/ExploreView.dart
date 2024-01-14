import 'package:crypto_app/core/Shared/Widgets/Button/PFButton.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:200,width:200, child: PFButton(onPressed: (){}, isProcessing: false, title: "Forex", icon: null, isSecondary: false)),
            const SizedBox(height: 15,),
            SizedBox(height:200,width:200, child: PFButton(onPressed: (){}, isProcessing: false, title: "Crypto", icon: null, isSecondary: false))
          ],
        ),
      )
    );
  }
}