package agenda

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AgendaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        int qntAtividades = 0
        for (Agenda x: Agenda.getAll()) {
          if (!x.completa)
            qntAtividades++
        }

        respond Agenda.list(params), model:[agendaCount: Agenda.count(), atvCompleta: qntAtividades]
    }

    def show(Agenda agenda) {
        respond agenda
        //[agenda: Agenda.get(params.id)]
    }

    def create() {
        respond new Agenda(params)
    }

    @Transactional
    def save(Agenda agenda) {
        if (agenda == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (agenda.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond agenda.errors, view:'create'
            return
        }

        agenda.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'agenda.label', default: 'Tarefa: '), agenda.tarefa])
                redirect (action: 'index')
                //redirect agenda
            }
            '*' { respond agenda, [status: CREATED] }
        }
    }

    def edit(Agenda agenda) {
        respond agenda
    }

    @Transactional
    def update(Agenda agenda) {
        if (agenda == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (agenda.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond agenda.errors, view:'edit'
            return
        }

        agenda.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'agenda.label', default: 'Agenda'), agenda.id])
                redirect action:"index"
                //redirect agenda
            }
            '*'{ respond agenda, [status: OK] }
        }
    }

    @Transactional
    def completar(Agenda agenda) {
      if (agenda == null) {
          transactionStatus.setRollbackOnly()
          notFound()
          return
      }

      agenda.completa = true
      agenda.save flush:true

      redirect(action: "index")

    }

    @Transactional
    def delete(Agenda agenda) {

        if (agenda == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        agenda.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'agenda.label', default: 'Tarefa: '), agenda.tarefa])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
