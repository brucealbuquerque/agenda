package agenda

class Agenda {

    String tarefa
    Date prazo
    String categoria

    static constraints = {
      tarefa nullable: false, black: false
      prazo nullable: false, black: false
      categoria inList: ["Pessoal","Profissional"], nullable: false, black: false
    }
}
