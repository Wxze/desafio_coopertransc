class Turn {
  final String id;
  final String dataMarcacao;
  final String horaMarcacao;
  final String cooperado;
  final String avatar;
  final String veiculo;
  final String engatado;
  final String tipoVeiculo;
  final String estados;
  final String? chegada;

  Turn(
    this.id,
    this.dataMarcacao,
    this.horaMarcacao,
    this.cooperado,
    this.avatar,
    this.veiculo,
    this.engatado,
    this.tipoVeiculo,
    this.estados,
    this.chegada,
  );

  factory Turn.fromJson(Map<String, dynamic> json) {
    return Turn(
      json['id'],
      json['data_marcacao'],
      json['hora_marcacao'],
      json['cooperado'],
      json['avatar'],
      json['veiculo'],
      json['Engatado'],
      json['tipo_veiculo'],
      json['estados'],
      json['chegada'],
    );
  }
}
