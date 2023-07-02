const dias = document.getElementById("dias");
const horas = document.getElementById("horas");
const minutos = document.getElementById("minutos");
const segundos = document.getElementById("segundos");
const fimPromocao = '28 December 2023';

function contagem() {

    const dataFimPromocao = new Date(fimPromocao);
    const dataAtual = new Date();

    const segundosTotais = (dataFimPromocao - dataAtual) / 1000;

    var days = Math.floor(segundosTotais / 3600 / 24);
    var hours = Math.floor(segundosTotais / 3600) %24;
    var mins = Math.floor(segundosTotais / 60) %60;
    var secs = Math.floor(segundosTotais)% 60;

    dias.innerHTML = days;
    horas.innerHTML = formatTime(hours);
    minutos.innerHTML = formatTime(mins);
    segundos.innerHTML = formatTime(secs);


}

function formatTime(time) {return time < 10 ? `${time}` : time;}

contagem();
setInterval(contagem, 1000);