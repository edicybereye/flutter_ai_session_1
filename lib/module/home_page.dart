import 'package:flutter/material.dart';
import 'package:flutter_ai/module/home_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context: context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.grey[300],
            body: Center(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width > 600
                    ? 400
                    : MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/pattern.jpg",
                        repeat: ImageRepeat.repeat,
                        opacity: AlwaysStoppedAnimation(.5),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                              width: 1,
                              color: Colors.grey[300] ?? Colors.transparent,
                            ))),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(360),
                              child: Image.asset(
                                "assets/ab2.jpg",
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("Edi Kurniawan"),
                            Spacer(),
                            Icon(
                              Icons.video_camera_back,
                              size: 20,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.call,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      left: 0,
                      right: 0,
                      child: ListView.builder(
                        itemCount: value.listChat.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, i) {
                          final a = value.listChat[i];
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: a.posisi == "kanan"
                                    ? Colors.green[200]
                                    : Colors.white),
                            margin: EdgeInsets.only(
                              bottom: 8,
                              left: a.posisi == 'kanan' ? 80 : 16,
                              right: a.posisi == 'kiri' ? 80 : 16,
                            ),
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "${a.chat}",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "${a.createdDate}",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // Positioned(
                    //     top: 50,
                    //     left: 0,
                    //     right: 0,
                    //     bottom: 60,
                    //     child: ListView(
                    //       reverse: true,
                    //       children: value.chats
                    //           .map((e) => Container(
                    //                 margin: EdgeInsets.only(
                    //                     bottom: 8, left: 80, right: 16),
                    //                 padding: EdgeInsets.all(8),
                    //                 decoration: BoxDecoration(
                    //                     color: Colors.blue[200],
                    //                     borderRadius:
                    //                         BorderRadius.circular(16)),
                    //                 child: Text(e),
                    //               ))
                    //           .toList(),
                    //     )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  top: BorderSide(
                                width: 1,
                                color: Colors.grey[300] ?? Colors.transparent,
                              ))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.add,
                                size: 20,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: TextField(
                                maxLines: null,
                                controller: value.chat,
                                style: TextStyle(fontSize: 12),
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: value.sendMessage,
                                      icon: Icon(Icons.send),
                                    ),
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide.none)),
                              )),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.camera_alt,
                                size: 20,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.mic,
                                size: 20,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        )),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
