class Personagem {
  int id;
  String nome;
  int idade;
  String classe;
  int nivel;

  Personagem(this.id, this.nome, this.idade, this.classe, this.nivel);

  @override
  String toString() {
    return 'Personagem(id: $id, nome: $nome, idade: $idade, classe: $classe, nivel: $nivel)';
  }

  void subirNivel() {
    nivel += 1;
    print('$nome subiu para o nível $nivel!');
  }
}