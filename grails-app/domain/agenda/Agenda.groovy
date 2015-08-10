package agenda
import org.grails.databinding.BindingFormat

class Agenda {

    String tarefa
    @BindingFormat('ddMMyyyy')
    Date prazo
    boolean completa
    Categoria categoria

    static belongsTo = Categoria

    static constraints = {
      tarefa nullable: false, black: false
      prazo nullable: false, black: false
      //categoria inList:[categoria.nome.label] , nullable: false, black: false
    }
    static mapping = {
      completa defaultValue: false
    }
}
