class Cliente {
  String nome;
  String email;
  String cpf;
  String telefone;
  String endereco;
  String numero;
  String bairro;
  String cidade;
  String estado;
  String cep;
  String complemento;

  Cliente({
    required this.nome,
    required this.email,
    required this.cpf,
    required this.telefone,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.cep,
    this.complemento = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'endereco': {
        'logradouro': endereco,
        'numero': numero,
        'complemento': complemento,
        'bairro': bairro,
        'cep': cep,
        'cidade': cidade,
        'estado': estado,
      },
      'pessoa': {
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'cpf': cpf,
      }
    };
  }
}
