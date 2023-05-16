//Código para as árvores de natal nos cards possam expandir ao passar o mouse

var promos = document.getElementsByClassName('promoimg');

for(let i = 0; i<promos.length; i++){
    promos[i].addEventListener("mouseover", function(){

        promos[i].parentElement.style.width = "fit-content";
        promos[i].parentElement.firstElementChild.style.display = "flex";
        promos[i].style.width = "50%";

    })
    promos[i].addEventListener("mouseout", function(){
        promos[i].parentElement.style.width = "40px";
        promos[i].parentElement.firstElementChild.style.display = "none";
        promos[i].style.width = "100%";
    })
}