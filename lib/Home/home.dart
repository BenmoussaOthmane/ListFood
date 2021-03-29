import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testapp/style.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Pinter.backG,
      appBar: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.stream,
                  color: Pinter.textT,
                  size: 18,
                ),
                Icon(
                  FontAwesomeIcons.search,
                  color: Pinter.textT,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h / 1,
          width: w / 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: w / 1,
                height: h / 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Ce qui pourrait vouz plaire',
                        style: TextStyle(
                            color: Pinter.textT,
                            fontFamily: Pinter.ffb,
                            fontSize: w / 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString("assets/food.json"),
                      builder: (context, snapshot) {
                        var data = json.decode(snapshot.data.toString());
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text('Loiding'),
                          );
                        }
                        return Container(
                          height: h / 1.2,
                          width: w / 1,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SlideInUp(
                                child: Container(
                                  height: h / 2,
                                  width: w / 1.2,
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(
                                  //     image: NetworkImage(data[index]['photo']),
                                  //     fit: BoxFit.cover
                                  //   )
                                  // ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Container(
                                            width: w / 1,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[400],
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey[500],
                                                      blurRadius: 15.0,
                                                      spreadRadius: 1.0
                                                      )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        data[index]['photo']),
                                                    fit: BoxFit.cover)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                      child: Text(
                                                        data[index]['price'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'facile - 15 min indien +3',
                                                      style: TextStyle(
                                                          color: Pinter.textT,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      'Produits disponible 7/7',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  data[index]['name'],
                                                  style: TextStyle(
                                                      color: Pinter.textT,
                                                      fontFamily: Pinter.ffb,
                                                      fontSize: w / 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Petite_Liicone',
                                                  style: TextStyle(
                                                      color: Pinter.textT,
                                                      fontFamily: Pinter.ffs,
                                                      fontSize: w / 30),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
