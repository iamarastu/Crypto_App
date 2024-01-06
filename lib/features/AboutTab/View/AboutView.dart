import 'package:crypto_app/core/Shared/Widgets/Button/PFButton.dart';
import 'package:crypto_app/core/Shared/Widgets/glassmorphism/Glassmorphism.dart';
import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          children: <Widget>[
            Expanded(child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(320, 15, 15, 8),
                  child: GestureDetector(
                    onTap: (){},
                    child: const Icon(Icons.edit),
                  ),
                  ),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey[850],
                          child: Text(
                            ("Aniket Sharma").substring(0, 1),
                            style: const TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 110,
                          right: 10,
                          child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFF7B7B7B),
                              child: Icon(
                                Icons.face,
                                color: Colors.amber[100],
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Glassmorphism(
                            blur: 3,
                            opacity: 0.1,
                            radius: 25,
                            hasBorder: true,
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              ("Aniket Sharma"),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 120,
                                            ),
                                            Text(
                                              'Emerald',
                                              style: TextStyle(
                                                color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            'Hi there i am an Flutter developer. I love to create apps.Hi there i am an Flutter developer. I love to create apps.',
                                            style: TextStyle(
                                              color: Colors.white
                                            ),
                                            )
                                      ],
                                    )),
                              ],
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Glassmorphism(blur: 3, opacity: 0.1, radius: 25,  hasBorder: true,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Contact :',
                                  style: TextStyle(
                                    color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),),
                                            Text('93132XXXXX',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 239, 236, 236),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                          ),
                          )
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Glassmorphism(blur: 3, opacity: 0.1, radius: 25,  hasBorder: true,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Email :',
                                  style: TextStyle(
                                    color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),),
                                            Text('aniket@gmail.com',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 239, 236, 236),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                          ),
                          )
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Glassmorphism(blur: 3, opacity: 0.1, radius: 25,  hasBorder: true,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Other Stuffs :',
                                  style: TextStyle(
                                    color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),),
                                            Text('Like Wallet',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 239, 236, 236),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),),
                                ],
                              )
                            ],
                          ),
                          )
                        )
                      ],
                    ),
                ),
                const SizedBox(height: 50,),
                PFButton(onPressed: (){}, isProcessing: false, title: "Logout", icon: null, isSecondary: false)
              ],
            ))
          ],
        ),)
        )
    );
  }
}