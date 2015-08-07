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
                  <li class="right"><g:link class="btn btn-new btn-small" action="create">Adicionar Categoria</g:link></li>
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
            <f:table collection="${categoriaList}" />

              <div class="pagination">
                  <g:paginate total="${categoriaCount ?: 0}" />
              </div>


          </div>
        </main>
      </div>


    </body>
</html>
