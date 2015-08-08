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
          <div role="navigation">
              <ul>
                  <li class="right">
                    <a class="btn btn-new btn-small" href="${createLink(uri: '/categoria')}">
                      Nova Categoria
                    </a>
                  </li>
                  <!--
                  <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                -->
              </ul>
          </div>
        </header>
          <main>
            <div role="main">
                <h1>
                  Atividades
                </h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <f:table collection="${agendaList}" />
                <nav>
                  <ul>
                    <li>
                      <g:link action="create" class="btn btn-add btn-small">
                        <g:message code="Adicionar Tarefa" />
                      </g:link>
                    </li>
                  </ul>
                </nav>

                <div class="pagination">
                    <g:paginate total="${agendaCount ?: 0}" />
                </div>
                <div class="countRegister">
                  Você possuí <i>${agendaCount}</i> Tarefas cadastradas
                </div>
            </div>
          </main>


        <footer>
        </footer>
      </div>
      <!--
        <a href="#list-agenda" class="skip" tabindex="-1">
          <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
        </a>
      -->
    </body>
</html>
