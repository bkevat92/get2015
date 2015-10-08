var row;

function fillcolor() {
    for (var i = 1; i <= row; i++) {
        var name = document.getElementById("inputtableTd" + (i + 1) + "1").value;
        document.getElementById("outputtableTd" + (i) + "1").innerHTML = name;

        var lower = document.getElementById("inputtableTd" + (i + 1) + "2").value;
        var upper = document.getElementById("inputtableTd" + (i + 1) + "3").value;

        for (var j = lower; j <= upper; j++) {
            var jj = Number(j) + 2;
            var id = "outputtableTd" + i + jj;
            document.getElementById(id).style.backgroundColor = "red";


        }
    }

}

function drawInputTable() {
    document.getElementById("inputtablediv").style.visibility = "visible";
    row = Number(document.getElementById("rowinput").value);
    var htmlStatement = "<table id=\"inputtable\" cellspacing=\"20\"><tr><td>NAME</td><td>MIN</td><td>MAX</td></tr>";
    for (var i = 2; i <= row + 1; i++) {
        htmlStatement += "<td class=\"tdip\"><input id=\"inputtableTd" + i + "1\" class=\"ip\" type=\"text\"></td>";
        htmlStatement += "<td class=\"tdip\"><input  id=\"inputtableTd" + i + "2\" class=\"ip\" type=\"number\" min=\"0\" max=\"10\"></td>";
        htmlStatement += "<td class=\"tdip\" ><input id=\"inputtableTd" + i + "3\" class=\"ip\" type=\"number\" min=\"0\" max=\"10\"></td>";
        htmlStatement += "</tr>";
    }
    htmlStatement += "</table><button id=\"button\" type=\"button\" onclick=\"drawOutputTable()\">OK</button>"
    document.getElementById("inputtablediv").innerHTML = htmlStatement;
}

function drawOutputTable() {
    document.getElementById("outputtablediv").style.visibility = "visible";
    var htmlStatement = "<table id=\"outputtable\">";
    for (var i = 1; i <= row; i++) {
        htmlStatement += "<tr><td class =\"opnametd\" id=\"outputtableTd" + i + "1\"></td>"
        for (var j = 2; j <= 12; j++) {
            htmlStatement += "<td class=\"opcolortd\" id=\"outputtableTd" + i + j + "\"></td>";
        }
        htmlStatement += "</tr>"
    }
    document.getElementById("outputtablediv").innerHTML = htmlStatement + "</table>";
    fillcolor();
}
