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
                  Tarefas
                  </h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
              <thead>
                <tr>
                  <th>Descrição</th>
                  <th style="width: 10%;" class="center">Deadline</th>
                  <th style="width: 12%;" class="center">Categoria</th>
                  <th style="width: 30%;">Ações</th>
                </tr>
              </thead>
              <tbody>
                <g:each in="${agendaList}" status="i" var="task">
                <g:if test="${task.completa == false}">
                  <g:set var="dif" value="${((task.prazo.time - new Date().time) / 1000 / 60 / 60 / 24).intValue()}"/>
                  <tr class="${(dif < 0) ? 'atrasada' : (dif > 5? '' : 'noPrazo')}">
                    <td class="${task.completa ? 'completa' : ''}" >${task.tarefa}</td>

                    <td class="${task.completa ? 'completa center' : 'center'}" >
                      <g:formatDate format="dd/MM/yyyy" date="${task.prazo}" />
                    </td>

                    <td class="${task.completa ? 'completa center' : 'center'}">
                      ${task.categoria}
                    </td>

                    <td>
                      <g:form resource="${task}" method="DELETE">
                              <input class="btn btn-del btn-small" type="submit"
                              value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                              onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                              <g:if test="${task.completa == false}">
                                <g:link action="edit" id="${task.id}" class="btn btn-edit btn-small">Editar</g:link>
                                <g:link action="completar" id="${task.id}" class="btn btn-complete btn-small">Completar</g:link>
                              </g:if>
                      </g:form>

                    </td>
                  </tr>
                  </g:if>
                  <g:else>
                  <tr class="completa">
                    <td>${task.tarefa}</td>

                    <td class="center">
                      <g:formatDate format="dd/MM/yyyy" date="${task.prazo}" />
                    </td>

                    <td class="center">
                      ${task.categoria}
                    </td>

                    <td>
                      <g:form resource="${task}" method="DELETE">
                      <input class="btn btn-del btn-small" type="submit"
                      value="Remover Tarefa Completa"
                      onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                      </g:form>

                    </td>
                  </tr>
                  </g:else>
                </g:each>
              </tbody>
            </table>
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
              Você possuí <i>${atvCompleta}</i> não completas e <i>${agendaCount}</i> cadastradas
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
