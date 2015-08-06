<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>

    <body>
      <div class="wrapper">
        <header>
          <h1></h1>
        </header>
        <main>
          <div role="main">
              <h1><g:message code="default.list.label" args="[entityName]" /></h1>
              <g:if test="${flash.message}">
                  <div class="message" role="status">${flash.message}</div>
              </g:if>
              <f:table collection="${agendaList}" />

              <div class="pagination">
                  <g:paginate total="${agendaCount ?: 0}" />
              </div>
          </div>
          <nav>
            <ul>
              <li>
                <g:link action="create" class="btn btn-add">
                  <g:message code="Adicionar Tarefa" />
                </g:link>
              </li>
            </ul>
          </nav>
        </main>
        <footer>
        </footer>
      </div>
      <!--
        <a href="#list-agenda" class="skip" tabindex="-1">
          <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
        </a>
      -->
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/agenda')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>

    </body>
</html>
