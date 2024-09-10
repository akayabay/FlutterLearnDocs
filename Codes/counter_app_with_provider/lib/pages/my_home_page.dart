import 'package:counter_app_with_provider/provider/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // CartModel, en üstteki ChangeNotifierProvider bildirimi aracılığıyla uygulamamızdaki widget'lara sağlandığına göre artık onu kullanmaya başlayabiliriz.
            // Bu, Consumer widget'ı aracılığıyla yapılır. Erişmek istediğimiz modelin türünü belirtmeliyiz.
            // Bu durumda, CartModel istiyoruz, bu yüzden Consumer<CartModel> yazıyoruz. Generic'i (<CartModel>) belirtmezseniz, provider paketi size yardımcı olamaz.
            // provider tipleri temel alır ve tip olmadan ne istediğinizi bilemez.
            // Consumer widget'ının tek gerekli argümanı builder'dır. Builder, ChangeNotifier her değiştiğinde çağrılan bir fonksiyondur.
            // (Başka bir deyişle, modelinizde notifyListeners() işlevini çağırdığınızda, ilgili tüm Consumer widget'larının tüm builder yöntemleri çağrılır).
            // Builder üç argümanla çağrılır. Bunlardan ilki, her oluşturma yönteminde de aldığınız bağlamdır(context).
            // Builder fonksiyonunun ikinci argümanı ChangeNotifier örneğidir. İlk etapta istediğimiz şey buydu. Herhangi bir noktada kullanıcı arayüzünün nasıl görünmesi gerektiğini tanımlamak için modeldeki verileri kullanabilirsiniz.
            // Üçüncü argüman, optimizasyon için orada bulunan child'dır. Consumer'ınızın altında model değiştiğinde değişmeyen büyük bir widget alt ağacınız varsa, bunu bir kez oluşturabilir ve oluşturucu aracılığıyla alabilirsiniz.
            Consumer<CounterModel>(
              builder:
                  (BuildContext context, CounterModel value, Widget? child) {
                return Column(
                  children: [
                    Text(
                      value.getCounter.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      context.watch<CounterModel>().getCounter.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Bazen, kullanıcı arayüzünü değiştirmek için modeldeki verilere gerçekten ihtiyacınız olmaz, ancak yine de bunlara erişmeniz gerekir.
            // Örneğin, bir ClearCart düğmesi kullanıcının sepetteki her şeyi kaldırmasına izin vermek ister.
            // Sepetin içeriğini görüntülemesine gerek yoktur, sadece clear() yöntemini çağırması gerekir.
            // Bunun için Consumer<CartModel> kullanabiliriz, ancak bu israf olur.
            // Framework'ten yeniden oluşturulmasına gerek olmayan bir widget'ı yeniden oluşturmasını istemiş oluruz.
            // Bu kullanım durumu için, listen parametresi false olarak ayarlanmış Provider.of'u kullanabiliriz.
            onPressed: () => Provider.of<CounterModel>(context, listen: false)
                .incrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () => Provider.of<CounterModel>(context, listen: false)
                .decrementCounter(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
