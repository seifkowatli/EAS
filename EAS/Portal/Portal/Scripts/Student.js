

$(document).ready(function(){


    // get the last DIV which ID starts with ^= "klon"
    var $div = $('div[id^="contanier"]:last');

    // Read the Number from that DIV's ID (i.e: 3 from "klon3")
    // And increment that number by 1
    var num = parseInt($div.prop("id").match(/\d+/g), 10) + 1;

    // Clone it and assign the new ID (i.e: from num 4 to ID "klon4")
    var $klon = $div.clone().prop('id', 'contanier' + num);

    $klon.find("#a22").attr("href", "#333");
    $klon.find("#collapseOne").attr("id", "333");
    // Finally insert $klon wherever you want
    $div.append($klon);

    
})