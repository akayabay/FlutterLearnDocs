import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final _cardHeight = 80.0;
  final _demoPicURL =
      "https://plus.unsplash.com/premium_photo-1669748157617-a3a83cc8ea23?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3Vuc2V0JTIwYmVhY2h8ZW58MHx8MHx8fDA%3D";
  final String _loremIpsum =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned.fill(bottom: _cardHeight / 2, child: RandomImage(picURL: _demoPicURL)),
                  Positioned(
                    //bottom: 0,
                    height: _cardHeight,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const _CustomCard(
                      title: "ACCRA BEACH HOTEL & SPA",
                      subtitle: "Rockley, Barbados",
                      money: "1050",
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                        backgroundColor: Colors.transparent,
                        fixedSize: const Size(40, 45),
                      ),
                      onPressed: () {},
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _CustomTextWithStyles(
                            string: "Participants",
                            color: _CustomCardColors().titleColor,
                            fontsize: 20,
                            fontWeight: FontWeight.bold),
                        _CustomTextWithStyles(
                            string: "Info",
                            color: _CustomCardColors().titleColor,
                            fontsize: 20,
                            fontWeight: FontWeight.bold),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            _CustomTextWithStyles(
                                string: "4.9",
                                color: _CustomCardColors().titleColor,
                                fontsize: 20,
                                fontWeight: FontWeight.bold),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.people_alt_outlined,
                              size: 50,
                              color: Colors.blueGrey,
                            ),
                            _CustomTextWithStyles(
                                string: "max.8", color: Colors.blueGrey, fontsize: 25, fontWeight: FontWeight.bold),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 50,
                              color: Colors.blueGrey,
                            ),
                            _CustomTextWithStyles(
                                string: "50 km", color: Colors.blueGrey, fontsize: 25, fontWeight: FontWeight.bold),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.schedule_outlined,
                              size: 50,
                              color: Colors.blueGrey,
                            ),
                            _CustomTextWithStyles(
                                string: "5 Days", color: Colors.blueGrey, fontsize: 25, fontWeight: FontWeight.bold),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _CustomTextWithStyles(
                            string: "Description", color: Colors.black, fontsize: 30, fontWeight: FontWeight.w700),
                        const SizedBox(
                          height: 5,
                        ),
                        _CustomTextWithStyles(
                            string: _loremIpsum, color: Colors.black, fontsize: 15.5, fontWeight: FontWeight.w500),
                      ],
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                  backgroundColor: Colors.deepOrange[800]),
                              onPressed: () {},
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.53,
                                height: MediaQuery.of(context).size.width * 0.13,
                                child: const Center(
                                  child: _CustomTextWithStyles(
                                      string: "Join Now",
                                      color: Colors.white,
                                      fontsize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.10,
                                height: MediaQuery.of(context).size.width * 0.13,
                                child: const Center(
                                  child: _CustomTextWithStyles(
                                      string: "Chat", color: Colors.black, fontsize: 18, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _CustomTextWithStyles extends StatelessWidget {
  const _CustomTextWithStyles(
      {super.key, required this.string, required this.color, required this.fontsize, required this.fontWeight});

  final String string;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({super.key, required this.title, required this.subtitle, required this.money});
  final String title;
  final String subtitle;
  final String money;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 4, left: 7),
        title: _CustomTextWithStyles(
            string: title, color: _CustomCardColors().titleColor, fontsize: 16, fontWeight: FontWeight.bold),
        subtitle: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.blueGrey,
            ),
            _CustomTextWithStyles(
                string: subtitle, color: _CustomCardColors().subtitleColor, fontsize: 15, fontWeight: FontWeight.w500)
          ],
        ),
        trailing: _CustomTextWithStyles(
            string: "\$ $money", color: _CustomCardColors().moneyColor, fontsize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _CustomCardColors {
  Color titleColor = Colors.black;
  Color subtitleColor = Colors.blueGrey;
  Color moneyColor = Colors.deepOrangeAccent;
}
