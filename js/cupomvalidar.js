        //Código para validar o cupom
        let result = window.location.hash.substring(8);
        let input = document.getElementById('cupominput')
        if (result == 'false'){
            console.log('reconhecido falso')
            input.classList.remove('sucesso')
            input.classList.add('falha')
            input.placeholder = 'erro ao resgatar...';
        }else if(result == 'true'){
            console.log('reconhecido verdadeiro')

            input.classList.remove('falha')
            input.classList.add('sucesso');
            input.placeholder = 'cupom resgatado!';
        }