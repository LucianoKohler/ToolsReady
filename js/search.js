//Código para pesquisar na nav e redirecionar ao navegador
navBtn = document.getElementById('nav_submit')
QueryCont = document.getElementById('query')
console.log(navBtn ,QueryCont)

navBtn.addEventListener('click', () => {
    window.location = 'navegador.html#' + QueryCont.value;
})

