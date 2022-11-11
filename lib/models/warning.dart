class Warning {
  final String id;
  final String data_cadastro;
  final String data_publicacao;
  final String titulo;
  final String mensagem;
  final String usuario;

  Warning(
    this.id,
    this.data_cadastro,
    this.data_publicacao,
    this.titulo,
    this.mensagem,
    this.usuario,
  );

  factory Warning.fromJson(Map<String, dynamic> json) {
    return Warning(
      json['id'],
      json['data_cadastro'],
      json['data_publicacao'],
      json['titulo'],
      json['mensagem'],
      json['usuario'],
    );
  }
}
