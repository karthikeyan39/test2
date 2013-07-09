

function bindTicket(obj,TENANTID,STUDENTID)
{
        var url = "../../StudentHome/Handler/StudentTicketInfo.ashx?TENANTID="+TENANTID+"&STUDENTID="+STUDENTID+"";
         var xmlHttp = new XMLHttpRequest();
         xmlHttp.open("POST", url, false);
         xmlHttp.send(null);
         var layerHTML = xmlHttp.responseText;
         obj.empty().html(layerHTML);

}
function bindAnnocement(obj, TENANTID, STUDENTID,ProfileID)
{
    var url = "../../StudentHome/Handler/StudentAnnoucement.ashx?TENANTID=" + TENANTID + "&STUDENTID=" + STUDENTID + "&ProfileID=" + ProfileID + "";
         var xmlHttp = new XMLHttpRequest();
         xmlHttp.open("POST", url, false);
         xmlHttp.send(null);
         var layerHTML = xmlHttp.responseText;
         obj.empty().html(layerHTML);

}

function bindProfile(obj, TENANTID, STUDENTID) {
         var url = "../../StudentHome/Handler/StudentProfileDetail.ashx?TENANTID="+TENANTID+"&STUDENTID="+STUDENTID+"";
         var xmlHttp = new XMLHttpRequest();
         xmlHttp.open("POST", url, false);
         xmlHttp.send(null);
         var layerHTML = xmlHttp.responseText;
         var str = layerHTML.split(",");
         obj.find('.fn1').html(str[0]);
         obj.find('.mn1').html(str[1]);
         obj.find('.ln1').html(str[2]);
         obj.find('.ei1').html(str[3]);
         obj.find('.pn1').html(str[4]);

} 