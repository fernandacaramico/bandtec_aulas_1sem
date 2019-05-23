




    // comeco do ex 11
    var linhas = ['azul', 'verde', 'vermelha', 'amarela', 'lilás'];
    var contagens = [0, 0, 0, 0, 0];

    function cadLinha() {
        var achou = 0;
        for (i = 0; i < linhas.length; i++) {
            if (linhaCad.value == linhas[i]) {
                achou++;
                contagens[i]++;
                // adicionando 1 ao encontrar a linha de posição i
            }
        }

        if (achou == 0) {
            alert('Linha não existe. Cadastro inválido!');
        }
    }

    function relatorioTrem() {
        fraseMetro.innerHTML = '';
        imagensMetro.innerHTML = '';
        var maior = 0;
        var linha_maior;

        for (i = 0; i < linhas.length; i++) {
            var cor = linhas[i];
            // loop interando para todas as linhas
            if (contagens[i] > maior) {
                maior = contagens[i]; //
                linha_maior = linhas[i];
            } // vendo qual foi a linha mais usada

            for (i_cor = 0; i_cor < contagens[i]; i_cor++) {
                imagensMetro.innerHTML += `<img src="trem-${cor}.png">`
                // loop interando no numero de vezes que o trem foi usado
            }
        }
        imagensMetro.style.display = "block";
        fraseMetro.innerHTML += `<br>A linha que você mais pegou foi a <b>${linha_maior}</b>`;
    }
    // fim do ex 11