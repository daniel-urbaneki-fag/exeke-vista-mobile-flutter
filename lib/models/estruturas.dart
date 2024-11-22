class EstruturaMetalica {
  String tipoEstrutura;
  String areaCobertura;
  String numeroModulos;
  String tipoTelha;
  String idadeAparente;

  String vaoLivreTesoura;
  String alturaTesoura;
  String alturaPerfilTesoura;
  String larguraPerfilTesoura;
  String espessuraPerfilTesoura;

  String distanciaTer;
  String alturaTer;
  String larguraPerfilTer;
  String espessuraPerfilTer;
  String perfilEnrijecidoTer;

  String distanciaPilaresComple;
  bool contraAvantamentoComple;
  bool agulhamentoComple;

  EstruturaMetalica({
    required this.tipoEstrutura,
    required this.areaCobertura,
    required this.numeroModulos,
    required this.tipoTelha,
    required this.idadeAparente,
    required this.vaoLivreTesoura,
    required this.alturaTesoura,
    required this.alturaPerfilTesoura,
    required this.larguraPerfilTesoura,
    required this.espessuraPerfilTesoura,
    required this.distanciaTer,
    required this.alturaTer,
    required this.larguraPerfilTer,
    required this.espessuraPerfilTer,
    required this.perfilEnrijecidoTer,
    required this.distanciaPilaresComple,
    required this.contraAvantamentoComple,
    required this.agulhamentoComple,
  });

  Map<String, dynamic> toJson() {
    return {
      'tipo_estrutura': {
        'tipo_perfil_tes': _toFloat(espessuraPerfilTer),
        'espess_perf_tes': _toFloat(espessuraPerfilTesoura),
        'larg_perf_tes': _toFloat(larguraPerfilTesoura),
        'alt_perf_tes': _toFloat(alturaPerfilTesoura),
        'alt_tes': _toFloat(alturaTesoura),
        'vao_livre_tes': _toFloat(vaoLivreTesoura),
        'contra_aventamento': contraAvantamentoComple,
        'agulhamento': agulhamentoComple,
        'dis_pilares': _toFloat(distanciaPilaresComple),
        'perf_enrijecido_ter': _toFloat(perfilEnrijecidoTer),
        'larg_perf_ter': _toFloat(larguraPerfilTer),
        'alt_perf_ter': _toFloat(alturaTer),
      },
      'estrutura': {
        'tipo_estrutura': tipoEstrutura,
        'area_cobertura': _toFloat(areaCobertura),
        'numero_modulos': _toFloat(numeroModulos),
        'tipo_telha': tipoTelha,
        'idade_aparente': idadeAparente,
        'dis_ter': _toFloat(distanciaTer),
      },
    };
  }

  double? _toFloat(String value) => double.tryParse(value.replaceAll(',', '.'));
}

class EstruturaMadeira {
  String tipoEstrutura;
  String areaCobertura;
  String numeroModulos;
  String tipoTelha;
  String idadeAparente;

  String vaoLivreTesoura;
  String tipoCorteTesoura;
  String alturaTesoura;
  String alturaCorteTesoura;
  String larguraCorteTesoura;
  String diametroTroncoTesoura;

  String distanciaTer;
  String alturaCorteTer;
  String larguraCorteTer;

  String distanciaPilaresComple;
  String formaChumbamentoComple;

  EstruturaMadeira({
    required this.tipoEstrutura,
    required this.areaCobertura,
    required this.numeroModulos,
    required this.tipoTelha,
    required this.idadeAparente,
    required this.vaoLivreTesoura,
    required this.tipoCorteTesoura,
    required this.alturaCorteTesoura,
    required this.larguraCorteTesoura,
    required this.diametroTroncoTesoura,
    required this.distanciaTer,
    required this.alturaCorteTer,
    required this.alturaTesoura,
    required this.larguraCorteTer,
    required this.distanciaPilaresComple,
    required this.formaChumbamentoComple,
  });

  Map<String, dynamic> toJson() {
    return {
      'tipo_estrutura': {
        'vao_livre_tes': _toFloat(vaoLivreTesoura),
        'tipo_corte_tes': tipoCorteTesoura,
        'alt_corte_tes': _toFloat(alturaCorteTesoura),
        'alt_tes': _toFloat(alturaTesoura),
        'larg_corte_tes': _toFloat(larguraCorteTesoura),
        'diametro_tronco_tes': _toFloat(diametroTroncoTesoura),
        'alt_corte_ter': _toFloat(alturaCorteTer),
        'larg_corte_ter': _toFloat(larguraCorteTer),
        'dis_pilares': _toFloat(distanciaPilaresComple),
        'forma_chumbamento': formaChumbamentoComple,
      },
      'estrutura': {
        'tipo_estrutura': tipoEstrutura,
        'area_cobertura': _toFloat(areaCobertura),
        'numero_modulos': _toFloat(numeroModulos),
        'tipo_telha': tipoTelha,
        'idade_aparente': idadeAparente,
        'dis_ter': _toFloat(distanciaTer),
      },
    };
  }

  double? _toFloat(String value) => double.tryParse(value.replaceAll(',', '.'));
}

class EstruturaConcreto {
  String tipoEstrutura;
  String areaCobertura;
  String numeroModulos;
  String tipoTelha;
  String idadeAparente;

  String vaoLivreTesoura;
  String tipoTravamentoTesoura;

  String distanciaTer;
  String tipoTer;

  bool contraAventamentoComple;
  bool agulhamentoComple;
  bool tiranteCentralComple;

  EstruturaConcreto({
    required this.tipoEstrutura,
    required this.areaCobertura,
    required this.numeroModulos,
    required this.tipoTelha,
    required this.idadeAparente,
    required this.vaoLivreTesoura,
    required this.tipoTravamentoTesoura,
    required this.distanciaTer,
    required this.tipoTer,
    required this.contraAventamentoComple,
    required this.agulhamentoComple,
    required this.tiranteCentralComple,
  });

  Map<String, dynamic> toJson() {
    return {
      'tipo_estrutura': {
        'vao_livre': _toFloat(vaoLivreTesoura),
        'tipo_travamento': tipoTravamentoTesoura,
        'tipo_ter': tipoTer,
        'contra_aventamento': contraAventamentoComple,
        'agulhamento': agulhamentoComple,
        'tirante_central': tiranteCentralComple,
      },
      'estrutura': {
        'tipo_estrutura': tipoEstrutura,
        'area_cobertura': _toFloat(areaCobertura),
        'numero_modulos': _toFloat(numeroModulos),
        'tipo_telha': tipoTelha,
        'idade_aparente': idadeAparente,
        'dis_ter': _toFloat(distanciaTer),
      },
    };
  }

  double? _toFloat(String value) => double.tryParse(value.replaceAll(',', '.'));
}
