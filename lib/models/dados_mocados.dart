var jogadores = ["jogador 1", "jogador 2", "jogador 3", "jogador 4", "jogador 5"];
List<String> roomList = ['elfo', 'goblin', 'human'];

class Jogador {
  var nome;
  var sexo;
  int level;
  int forca;
  int posicao;
  
  Jogador(this.nome, this.sexo, this.level, this.forca, this.posicao);

  int getScoreTotal(Jogador jogador){
    int scoreTotal = jogador.level + jogador.forca;

    return scoreTotal;
  }

  String setSexo(Jogador jogador) {
    if (jogador.sexo == "M"){
      return jogador.sexo = "F";
    }else {
      return jogador.sexo = "M";
    }
  }

  String getPosicao(Jogador jogador) {
    return jogador.posicao.toString();
  }

  int addLevel(Jogador jogador) {
    return jogador.level += 1;
  }

  int addForca(Jogador jogador) {
    return jogador.forca += 1;
  }

  int removeLevel(Jogador jogador) {
    return jogador.level -= 1;
  }

  int removeForca(Jogador jogador) {
    return jogador.forca -= 1;
  }

}
