<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>

      <div class="wrapper">
        <header>
          <div>
              <ul>
                  <li class="right"><a class="btn btn-back btn-small" href="${createLink(uri: '/categoria/index')}">Ver Categorias</a></li>
                  <li class="right"><a class="btn btn-back btn-small" href="${createLink(uri: '/agenda/index')}">Ver Agenda</a></li>
                  <li class="right"><g:link class="btn btn-new btn-small" action="create">Nova Categoria</g:link></li>
              </ul>
          </div>
        </header>
        <main>
          <div id="edit-categoria" class="content scaffold-edit" role="main">
              <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
              <g:if test="${flash.message}">
              <div class="message" role="status">${flash.message}</div>
              </g:if>
              <g:hasErrors bean="${this.categoria}">
              <ul class="errors" role="alert">
                  <g:eachError bean="${this.categoria}" var="error">
                  <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                  </g:eachError>
              </ul>
              </g:hasErrors>
              <g:form resource="${this.categoria}" method="PUT">
                  <g:hiddenField name="version" value="${this.categoria?.version}" />
                  <fieldset class="form">
                      <f:all bean="categoria"/>
                  </fieldset>
                      <input class="btn btn-add btn-small" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
              </g:form>
          </div>
        </main>
      </div>
    </body>
</html>
