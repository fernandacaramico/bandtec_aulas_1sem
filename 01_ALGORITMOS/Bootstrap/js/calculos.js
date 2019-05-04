function info_banco(){
    /* Calculo do sistema financeiro onde vê a quantidade de crianças na unidade*/
    var ncrianca = num_crianca.value;
 

    /* Calculo do sistema financeiro que vê a quantidade de leite doado anualmente*/
    var leiteAnual = Number(num_leiteA.value);
 
    /* Calculo que vê a quantidade de leite desperdiçado anualmente*/
    var leiteDesperdicado = Number(num_leiteDesperdicadoA.value);
    var leiteMae =leiteDesperdicado * 0.8;
    var leiteBanco =leiteDesperdicado * 0.2;
    var desperdicioTotalP = (leiteDesperdicado * leiteAnual) / 100;
    numDesperdicioB.innerHTML = `Sem nossa solução, de  <b>${leiteAnual.toFixed(2)} litros</b> doados anualmente  <b>${desperdicioTotalP.toFixed(2)}% </b>são desperdiçados e  <b>${leiteMae} litros </b> são por causa da mae e <b> ${leiteBanco} litros </b> desperdiçados pelo banco `;
    numDesperdicioV.innerHTML = `Com nossa solução <b>${leiteBanco}%</b> serão desperdiçados e <b>${leiteBanco} Litros</b> do banco.`;
}

function info_mae(){
    /* Calculo mãe */
    var totalMae = Number(mae_leite.value);
    var criancaRecebe = totalMae * 10;
    mae_info.innerHTML = `Com ${totalMae} Litros de leite.`;
    forma_mae.innerHTML = ` Você alimentará <b>${criancaRecebe.toFixed(2)}</b> crianças`;

    /* Calculo da bolsa */
    var bolsas = Number(num_bolsa.value);
    var totalBolsa = bolsas * 4;
    bolsa_mae.innerHTML = `Com ${bolsas.toFixed(2)} bolsas, você podera armazenar ${totalBolsa.toFixed(2)}  garrafas`;
    bolsa_info.innerHTML = `Cada bolsa irá armazenar 4 garrafas.`;
}