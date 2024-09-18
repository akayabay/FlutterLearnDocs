// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnViewDart extends StatefulWidget {
  const ModelLearnViewDart({super.key});

  @override
  State<ModelLearnViewDart> createState() => _ModelLearnViewDartState();
}

class _ModelLearnViewDartState extends State<ModelLearnViewDart> {
  PostModel8 user9 = PostModel8(body: "BODY DATA");

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..id = 1
      ..body = "adm";

    final user2 = PostModel2(2, 2, "a", "B");
    user2.body = "C";

    final user3 = PostModel3(1, 2, "title", "body");
    //user3.body = "";

    final user4 = PostModel4(userId: 1, id: 1, title: "title", body: "dfa");

    final user5 = PostModel5(userId: 1, id: 2, title: "title", body: "");
    user5.getUserId;

    final user6 = PostModel6(userId: 1, id: 2, title: "", body: "bod");

    final user7 = PostModel7();

    //Service
    final user8 = PostModel8(body: "asdas");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${user9.body ?? 'No has any body data.'} ${user9.title ?? '& No has any title data.'}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Bu kullanım datayı alır ancak önceki dataların kaybolmasına sebep olur.
          // Çünkü burada bir instance özelinde atama yapılmadı.
          // PostModel8'den yeni bir nesne oluşturuldu, bu eski nesnenin yok olmasına sebep oldu ve diğer datalarıda örn title gitmiş oldu.
          setState(() {
            //user9 = PostModel8(title: "TİTLE DATA");

           // Eski değerlerin gitmemesi için yazdığımız copywith ile yeni nesne oluşturuyoruz.
           user9 = user9.copyWith(title: "TİTLE DATA");
           user9.updateBody("BODY 2");
          });
        },
      ),
    );
  }
}
