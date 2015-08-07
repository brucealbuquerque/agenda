<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="wrapper">
        <header>
          <!--
          <a href="#create-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        -->
          <div role="navigation">
              <ul>
                  <li><a class="btn btn-back btn-small" href="${createLink(uri: '/agenda')}">Ver Agenda</a></li>
                  <li><g:link class="btn btn-back btn-small" action="index">Ver Categorias</g:link></li>
              </ul>
          </div>
        </header>
        <main>
          <div id="create-categoria" class="content" role="main">
              <h1>Adicionar Categorias</h1>
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
              <g:form action="save">
                  <fieldset>
                      <f:all bean="categoria"/>
                  </fieldset>
                  <g:submitButton name="create" class="btn btn-add btn-large" value="${message(code: 'default.button.create.label', default: 'Create')}" />

              </g:form>
          </div>
        </main>
      </div>


    </body>
</html>
