enum Conversion {
  dolarAmericano('Dólar Americano', 'USD'),
  euro('Euro', 'EUR'),
  libraEsterlina('Libra esterlina', 'GBP'),
  iene('Iene', 'JPY'),
  dolarAustraliano('Dólar Australiano', 'AUD'),
  francoSuico('Franco Suíço', 'CHFRTS'),
  dolarCanadense('Dólar Canadense', 'CAD'),
  yuan('Yuan', 'CNY'),
  pesoArgentino('Peso Argentino', 'ARS'),
  real('Real', 'BRL'),
  liraTurca('Lira Turca', 'TRY');

  const Conversion(this.name, this.code);
  final String name;
  final String code;
}
