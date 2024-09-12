
import 'package:conversor/model/moeda_model.dart';

class HomeController{

  double valorEntrada = 0;
  double resultado = 0;
  String moedaSelecionada = "USD";

  // Instanciar a moeda:
  MoedaModel moeda = MoedaModel();
  List<String> nomeMoedasValidas = [] ;
  List<String> siglasMoedasValidas = [];
  Map<String, double> valores = {};
  
  // Construtor: (inicializa valores na sua instanciação)
  HomeController(){
    // Inicializar os valores obtendo-os do Model
    nomeMoedasValidas = moeda.nomeMoedasValidas;
    siglasMoedasValidas = moeda.siglasMoedasValidas;
    valores = moeda.valores;
  }


 void calcular(){
      resultado = moeda.calcular(moedaSelecionada, valorEntrada);
  }
}