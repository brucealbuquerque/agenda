package agenda

class Agenda {

    String tarefa
    Date prazo
    Categoria categoria

    static belongsTo = Categoria

    static constraints = {
      tarefa nullable: false, black: false
      prazo nullable: false, black: false
      //categoria inList:[categoria.nome.label] , nullable: false, black: false
    }
}
