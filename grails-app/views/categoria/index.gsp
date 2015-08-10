<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title>Categorias</title>
    </head>
    <body>
      <div class="wrapper">
        <header>
          <div role="navigation">
              <ul>
                  <li class="right"><a class="btn btn-back btn-small" href="${createLink(uri: '/agenda')}">Ver Agenda</a></li>
              </ul>
          </div>
        </header>
        <main>
          <div role="main">
            <h1>Categorias</h1>
              <g:if test="${flash.message}">
                  <div class="message" role="status">${flash.message}</div>
              </g:if>

              <table>
                <thead>
                  <tr>
                    <th>  Descrição  </th>
                    <th>  Ações  </th>
                  </tr>
                </thead>
                <tbody>
                  <g:each in="${categoriaList}" status="i" var="categoria">
                  <tr>
                    <td>${categoria.nome}</td>
                    <td>
                      <g:form resource="${categoria}" method="DELETE">
                            <input class="btn btn-del btn-small" type="submit"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                              <g:link action="edit" id="${categoria.id}" class="btn btn-edit btn-small">Editar</g:link>
                    </g:form>
                  </td>
                  </tr>
                </g:each>
                </tbody>
              </table>
              <nav>
                <ul>
                  <li>
                    <g:link action="create" class="btn btn-add btn-small">
                      <g:message code="Adicionar Categoria" />
                    </g:link>
                  </li>
                </ul>
              </nav>
              <div class="pagination">
                  <g:paginate total="${categoriaCount ?: 0}" />
              </div>
              <div class="countRegister">
                Você possuí <i>${categoriaCount}</i> Categorias cadastradas
              </div>
          </div>
        </main>
      </div>
  </body>
</html>
