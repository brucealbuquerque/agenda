<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="wrapper">
        <header>
          <div role="navigation">
              <ul>
                  <li class="right">
                    <a class="btn btn-back btn-small" href="${createLink(uri: '/agenda')}" >Ver Agenda</a>
                  </li>
              </ul>
          </div>
        </header>
          <main>
            <div id="create-agenda" class="content" role="main">
                <h1>Nova Tarefa</h1>
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
                <g:form action="save">
                    <fieldset>
                        <f:all bean="agenda"/>
                    </fieldset>
                    <g:submitButton name="create" class="btn btn-add btn-large" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </g:form>
          </main>
          <footer></footer>
        </div>
      </div>





    </body>
</html>
