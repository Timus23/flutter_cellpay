import 'package:cellpay/cellpay/flutter_cellpay.dart';
import 'package:cellpay/cellpay/model/cellpay_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cell Pay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            MaterialButton(
              onPressed: () {
                final _cellPayConfig = CellpayConfig(
                  publicKey: "cellpayTestKey",
                  merchantId: "9801977888",
                  invoiceNumber: "11234",
                  description: "MERCHANT PAYMENT",
                  amount: 1000,
                  onSuccess: (val) async {},
                  onError: (val) {},
                );
                FlutterCellPay.payViaCellPay(_cellPayConfig);
              },
              child: const Text("Pay Via Cellpay"),
            )
          ],
        ),
      ),
    );
  }
}
