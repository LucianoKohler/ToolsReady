//Código para pesquisar na nav ou clicar em uma categoria, redirecionar ao navegador
navBtn = document.getElementById('nav_submit')
QueryCont = document.getElementById('query')

const Search = (query) => window.location = 'navegador.html#' + query

navBtn.addEventListener('click', () => Search(QueryCont.value))

