/*** CCP :: Proretention :: MDX :: Student Portal ***/
function currentTime() {
    var e = $(".lightred .icon-calendar").parent(),
        t = new Date,
        n = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        r = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    e.find(".details .big").html(n[t.getMonth()] + " " + t.getDate() + ", " + t.getFullYear());
    e.find(".details span").last().html(r[t.getDay()] + ", " + t.getHours() + ":" + ("0" + t.getMinutes()).slice(-2));
    setTimeout(function () {
        currentTime()
    }, 1e4)
}
$(document).ready(function () { currentTime(); $("#toTop").scrollToTop(); });
$(window).resize(function () {});
function getStudentProfile(TENANTID, STUDENTID) {
    var url = "../../StudentHome/Handler/StudentProfileDetail.ashx?TENANTID=" + TENANTID + "&STUDENTID=" + STUDENTID + "";
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("POST", url, false);
    xmlHttp.send(null);
    var layerHTML = xmlHttp.responseText;
    var str = layerHTML.split("~");
	var proImg = (str[2]=="")?"../Global/Images/proImgEmpty.png":str[2];
	if(str[1].length>25)
	{
	    $("#lblusername").html(str[1].substr(0, 25) + "..<img class='stdimg' src='" + proImg + "' style='width:27px;height:27px;visibility: hidden' >");
	   // $("#lblusername").html(str[1].substr(0, 25));
  	} else
	{
	    $("#lblusername").html(str[1] + "<img class='stdimg' src='" + proImg + "' style='width:27px;height:27px;visibility: hidden' >");
	  //  $("#lblusername").html(str[1]);
	}
} 
 
