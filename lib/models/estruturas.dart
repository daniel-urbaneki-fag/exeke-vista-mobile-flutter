class EstruturaMetalica {
  String tipoEstrutura;
  String areaCobertura;
  String numeroModulos;
  String tipoTelha;
  String idadeAparente;

  // Informações tesouras
  String vaoLivreTesoura;
  String alturaTesoura;
  String alturaPerfilTesoura;
  String larguraPerfilTesoura;
  String espessuraPerfilTesoura;

  // Informações terças
  String distanciaTer;
  String alturaTer;
  String larguraPerfilTer;
  String espessuraPerfilTer;
  String perfilEnrijecidoTer;

  // Informações complementares
  String distanciaPilaresComple;
  String contraAvantamentoComple;
  String agulhamentoComple;

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
        'tipo_perfil_tes': espessuraPerfilTer,
        'espess_perf_tes': espessuraPerfilTesoura,
        'larg_perf_tes': larguraPerfilTesoura,
        'alt_perf_tes': alturaPerfilTesoura,
        'alt_tes': alturaTesoura,
        'vao_livre_tes': vaoLivreTesoura,
        'contra_aventamento': contraAvantamentoComple,
        'agulhamento': agulhamentoComple,
        'dis_pilares': distanciaPilaresComple,
        'perf_enrijecido_ter': perfilEnrijecidoTer,
        'larg_perf_ter': larguraPerfilTer,
        'alt_perf_ter': alturaTer,
      },
      'estrutura': {
        'tipo_estrutura': tipoEstrutura,
        'area_cobertura': areaCobertura,
        'numero_modulos': numeroModulos,
        'tipo_telha': tipoTelha,
        'idade_aparente': idadeAparente,
        'dis_ter': distanciaTer,
      },
    };
  }
}

class EstruturaMadeira {
  String tipoEstrutura;
  String areaCobertura;
  String numeroModulos;
  String tipoTelha;
  String idadeAparente;

  // Informações tesouras
  String vaoLivreTesoura;
  String tipoCorteTesoura;
  String alturaCorteTesoura;
  String larguraCorteTesoura;
  String diametroTroncoTesoura;

  // Informações terças
  String distanciaTer;
  String alturaCorteTer;
  String larguraCorteTer;

  // Informações complementares
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
    required this.larguraCorteTer,
    required this.distanciaPilaresComple,
    required this.formaChumbamentoComple,
  });

  Map<String, dynamic> toJson() {
    return {
      'tipo_estrutura': {
        'tipo_corte_tes': tipoCorteTesoura,
        'diametro_tronco_tes': diametroTroncoTesoura,
        'larg_corte_tes': larguraCorteTesoura,
        'alt_corte_tes': alturaCorteTesoura,
        'vao_livre_tes': vaoLivreTesoura,
        'alt_corte_ter': alturaCorteTer,
        'larg_corte_ter': larguraCorteTer,
        'dis_pilares': distanciaPilaresComple,
        'forma_chumbamento': formaChumbamentoComple,
      },
      'estrutura': {
        'tipo_estrutura': tipoEstrutura,
        'area_cobertura': areaCobertura,
        'numero_modulos': numeroModulos,
        'tipo_telha': tipoTelha,
        'idade_aparente': idadeAparente,
        'dis_ter': distanciaTer,
      },
    };
  }
}

class EstruturaConcreto {
  String tipoEstrutura;
  String areaCobertura;
  String numeroModulos;
  String tipoTelha;
  String idadeAparente;
  // Informações tesouras
  String vaoLivreTesoura;
  String tipoTravamentoTesoura;

  // Informações terças
  String distanciaTer;
  String tipoTer;

  // Informações complementares
  String contraAventamentoComple;
  String agulhamentoComple;
  String tiranteCentralComple;

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
        'vao_livre': vaoLivreTesoura,
        'tipo_travamento': tipoTravamentoTesoura,
        'tipo_ter': tipoTer,
        'contra_aventamento': contraAventamentoComple,
        'agulhamento': agulhamentoComple,
        'tirante_central': tiranteCentralComple,
      },
      'estrutura': {
        'tipo_estrutura': tipoEstrutura,
        'area_cobertura': areaCobertura,
        'numero_modulos': numeroModulos,
        'tipo_telha': tipoTelha,
        'idade_aparente': idadeAparente,
        'dis_ter': distanciaTer,
      },
    };
  }
}
