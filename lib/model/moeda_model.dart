class MoedaModel{
    // Lista de moedas válidas:
  List<String> siglasMoedasValidas = ["USD", "BTC", "EUR"];
  List<String> nomeMoedasValidas = ["Dolar", "Bitcoin", "Euro"];

  Map<String, double> valores = {
                        "USD" : 5.00,
                        "BTC" : 0.0000000007,
                        "EUR" : 6.50
                      };
  
   double calcular(moedaSelecionada, valor){
    return valor * valores[moedaSelecionada];
  }
}