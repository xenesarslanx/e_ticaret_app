 import 'package:flutter/material.dart';

Future<void> myBottomSheet(BuildContext context, String imagePath, String isim, String model, String fiyat, Widget widget) {
    return showModalBottomSheet<void>(
                      backgroundColor: const Color.fromARGB(255, 222, 204, 210),
                     useSafeArea: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Image(
                                    image: NetworkImage(
                                        imagePath,//gelenVeri[index].resim.toString()
                                        ),
                                    height: 200,
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                   isim, //"${gelenVeri[index].isim}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                   model,// "${gelenVeri[index].telModel} \n",
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                  "$fiyat TL",// "${gelenVeri[index].fiyat} TL",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                widget,
                              ],
                            ),
                          );
                        });
  }