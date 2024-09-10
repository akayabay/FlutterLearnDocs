import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});
  final String _title = "Welcome Learn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true, // Bu özellik verilmez ise android tarafında başta, iosta ortada defult olarak başlar
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 45, // leading konumu
        //actionsIconTheme: const IconThemeData(color: Colors.red), // Birden fazla icona tek seferde müdahale etmeye yarar
        automaticallyImplyLeading: false, // default olan geri butonunu kapatır
        systemOverlayStyle: SystemUiOverlayStyle.light, // Appbar üzerinde olan statusbarın rengini yönetmeye yarar. Saat, sarj, wife etc. olan kısım.
        // Sol köşe
        leading: const Icon(Icons.chevron_left_rounded),
        // Sağ köşe
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.email),
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
