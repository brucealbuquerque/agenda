<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="wrapper">
        <header>
          <div class="nav" role="navigation">
              <ul>
                  <li class="right"><g:link class="btn btn-new btn-small" action="create">Nova Tarefa</g:link></li>
                  <li class="right"><a class="btn btn-back btn-small" href="${createLink(uri: '/agenda/index')}">Ver Agenda</a></li>
              </ul>
          </div>
        </header>
        <main>
          <div class="content" role="main">
              <h1>Editar Tarefa</h1>
              <g:if test="${flash.message}">
              <div class="message" role="status">${flash.message}</div>
              </g:if>
              <g:hasErrors bean="${this.agenda}">
              <ul class="errors" role="alert">
                  <g:eachError bean="${this.agenda}" var="error">
                  <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                  </g:eachError>
              </ul>
              </g:hasErrors>
              <g:form resource="${this.agenda}" method="PUT">
                  <g:hiddenField name="version" value="${this.agenda?.version}" />
                  <fieldset class="form">
                      <f:all bean="agenda"/>
                  </fieldset>

                      <input class="btn btn-add btn-small" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />

              </g:form>
          </div>
        </main>
      </div>






    </body>
</html>
