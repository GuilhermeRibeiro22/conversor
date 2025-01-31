import 'dart:ffi';
import 'package:conversor/controller/home_controller.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Conversor de Moedas",
        style: TextStyle(color: Colors.white
            ),
          )
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/images/coin-removebg-preview.png',
                width: 200,
              ),
            ),
            const Text(
              'Conversor de Dinheiros',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text("Valor: R\$")),
                onChanged: (value) {
                  setState(() {
                    controller.valorEntrada = double.tryParse(value) ?? 0.0;
                    controller.calcular();            
                  });
                },
              ),
            ),
            CustomRadioButton(
              enableShape: true,
              elevation: 0,
              unSelectedBorderColor: const Color.fromARGB(0, 0, 0, 0),
              selectedBorderColor: const Color.fromARGB(0, 0, 0, 0),
              absoluteZeroSpacing: false,
              unSelectedColor: Theme.of(context).canvasColor,
              buttonLables: controller.nomeMoedasValidas,
              buttonValues: controller.siglasMoedasValidas,
              buttonTextStyle: const ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.black,
                  textStyle: TextStyle(fontSize: 16)),
              radioButtonValue: (value) {
                controller.moedaSelecionada = value.toString();
                controller.calcular();
              }, 
              selectedColor: Colors.black,
              defaultSelected: controller.moedaSelecionada,
            ),
            Text(
              'Resultado: ${controller.resultado}',
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
