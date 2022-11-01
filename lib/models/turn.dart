class Turn {
  final int id;
  final String dataMarcacao;
  final String horaMarcacao;
  final int idUnidade;
  final String obs;
  final String cooperado;
  final String avatar;
  final String veiculo;
  final String engatado;
  final String tipoVeiculo;
  final String unidade;
  final String estados;
  final String? chegada;

  Turn(
    this.id,
    this.dataMarcacao,
    this.horaMarcacao,
    this.idUnidade,
    this.obs,
    this.cooperado,
    this.avatar,
    this.veiculo,
    this.engatado,
    this.tipoVeiculo,
    this.unidade,
    this.estados,
    this.chegada,
  );

  factory Turn.fromJson(Map<String, dynamic> json) {
    
    return Turn(
      json['id'],
      json['data_marcacao'],
      json['hora_marcacao'],
      json['id_unidade'],
      json['obs'],
      json['cooperado'],
      json['avatar'],
      json['veiculo'],
      json['engatado'],
      json['tipo_veiculo'],
      json['unidade'],
      json['estados'],
      json['chegada'],
    );
  }
}
