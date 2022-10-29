class User {
  final int id;
  final String nome;
  final String username;
  final String email;
  final String avatar;
  final String token;

  User(this.id, this.nome, this.username, this.email, this.avatar, this.token);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['nome'],
      json['username'],
      json['email'],
      json['avatar'],
      json['token'],
    );
  }
}
