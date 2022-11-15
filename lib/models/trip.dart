class Trip {
  final String id;
  final String dataMarcacao;
  final String horaMarcacao;
  final String escolha;
  final String dataEscolha;
  final String horaEscolha;
  final String estadoOrigem;
  final String cidadeOrigem;
  final String estadoDestino;
  final String cidadeDestino;
  final String distancia;
  final String obs;
  final String? dataRetorno;
  final String perdeVez;
  final String nome;
  final String descricao;
  final String tipo;
  final String placa;

  Trip(
    this.id,
    this.dataMarcacao,
    this.horaMarcacao,
    this.escolha,
    this.dataEscolha,
    this.horaEscolha,
    this.estadoOrigem,
    this.cidadeOrigem,
    this.estadoDestino,
    this.cidadeDestino,
    this.distancia,
    this.obs,
    this.dataRetorno,
    this.perdeVez,
    this.nome,
    this.descricao,
    this.tipo,
    this.placa,
  );

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      json['id'],
      json['data_marcacao'],
      json['hora_marcacao'],
      json['escolha'],
      json['data_escolha'],
      json['hora_escolha'],
      json['estado_origem'],
      json['cidade_origem'],
      json['estado_destino'],
      json['cidade_destino'],
      json['distancia'],
      json['obs'],
      json['data_retorno'],
      json['perde_vez'],
      json['nome'],
      json['descricao'],
      json['tipo'],
      json['placa'],
    );
  }
}
