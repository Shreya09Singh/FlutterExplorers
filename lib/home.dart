import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

double availableScreensizewidth = 0;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    availableScreensizewidth = MediaQuery.of(context).size.width - 50;
    var color = const Color.fromARGB(255, 34, 77, 153);
    int selectedindex = 0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          height: 170,
          width: double.infinity,
          color: const Color.fromARGB(255, 34, 77, 153),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Riotters",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Team Folder",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.1)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.1)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 28,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: const TextSpan(
                      text: "Storage ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                    TextSpan(
                        text: "9.1/10GB",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300))
                  ])),
              Text(
                "Upgrade",
                style: TextStyle(
                    fontSize: 19, fontWeight: FontWeight.bold, color: color),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              buildFileSizechart("SOURCES", Colors.blue, .3),
              const SizedBox(
                width: 5,
              ),
              buildFileSizechart("DOCS", Colors.red, .23),
              const SizedBox(
                width: 5,
              ),
              buildFileSizechart(
                  "IMAGES", const Color.fromARGB(255, 232, 214, 49), .20),
              const SizedBox(
                width: 5,
              ),
              buildFileSizechart("", Colors.grey.shade200, .20)
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          height: 25,
        ),
        Expanded(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recently Updated",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: [
                      buildFilecolumn('sketch', 'desktop', '.sketch'),
                      SizedBox(
                        width: availableScreensizewidth * .03,
                        height: 10,
                      ),
                      buildFilecolumn('sketch', 'mobile', '.sketch'),
                      SizedBox(
                        width: availableScreensizewidth * .03,
                        height: 10,
                      ),
                      buildFilecolumn('sketch', 'intersecton', '.sketck'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 29,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Projects",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "Create new",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Column(
                    children: [
                      listmethodFile("Chatbox"),
                      listmethodFile("TimeNote"),
                      listmethodFile("TimeNote"),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        currentIndex: selectedindex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Time'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Folder')
        ],
      ),
    );
  }

  Container listmethodFile(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(11)),
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.folder,
                  color: Color.fromARGB(255, 34, 77, 153),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )
              ],
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
      ),
    );
  }

  Column buildFilecolumn(String img, String filename, String extension) {
    return Column(
      children: [
        Container(
          height: 110,
          width: availableScreensizewidth * .31,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.network(
                "https://www.transparentpng.com/thumb/emerald-stone/emerald-stone-pictures-5.png"),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
            text: TextSpan(
                text: filename,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: extension,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w300))
            ]))
      ],
    );
  }

  Column buildFileSizechart(String title, Color colors, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: availableScreensizewidth * width,
          height: 4,
          color: colors,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
