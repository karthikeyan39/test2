var z_RIGHT = "right";

var MARGIN_BOTTOM = 0;
var MARGIN_RIGHT = 0;

var currentItem = null;


var menuTrail = new Array();


var currentStyleOff = null;

function zon(item, level, styleOn, styleOff, submenuId, submenuPosition) {

  if (item.onmouseout == null) {
    item.onmouseout = startOffTimer;
  }

 
  stopOffTimer();


  if (currentItem != null) {
    if (styleOff != currentStyleOff && currentStyleOff != null) {
      currentItem.className = currentStyleOff;
    } else {
      currentItem.className = styleOff;
    }
  }


  currentItem = item;
  item.className = styleOn;
  currentStyleOff = styleOff;


  if (submenuId != null && document.getElementById(submenuId)) 
  {

    hide(level);


    var menu = document.getElementById(submenuId);
	
	menu_top_position = 0;
	menu_left_position = 0;

    if (submenuPosition == z_BOTTOM) 
	{
      menu_top_position = findOffsetTop(item) + item.offsetHeight + MARGIN_BOTTOM;
      menu_left_position = findOffsetLeft(item);
    }

    if (submenuPosition == z_RIGHT) 
	{
		menu_top_position = findOffsetTop(item);
		menu_left_position = findOffsetLeft(item) + item.offsetWidth + MARGIN_RIGHT;
    }
	
	
	menu.style.top = menu_top_position+"px";
	menu.style.left = menu_left_position+"px";
	
    menu.style.visibility = "visible";

    menuTrail[level] = menu;
  } else {

   
    hide(level);
  }

}



function hide(level) {
  for (var i = level; i < menuTrail.length; i++) {
    menuTrail[i].style.visibility = "hidden";
  }
}


var timerID = null;
var timerOn = false;
var timecount = 250;

function startOffTimer() {
  if (timerOn == false) {
    timerID = setTimeout("offAll()", timecount);
    timerOn = true;
  }
}

function stopOffTimer() {
  if (timerOn) {
    clearTimeout(timerID);
    timerID = null;
    timerOn = false;
  }
}

function offAll() {
  hide(0);
  
  if (currentStyleOff != null) {
    currentItem.className = currentStyleOff;
  }
 

}

function findOffsetLeft(obj){
  var curleft = 0;
  if (obj.offsetParent){
    while (obj.offsetParent){
      curleft += obj.offsetLeft;
      obj = obj.offsetParent;
    }
  } else if (obj.x) {
    curleft += obj.x;
  }

  return curleft;
}

function findOffsetTop(obj){
  var curtop = 0;
  if (obj.offsetParent)	{
    while (obj.offsetParent){
      curtop += obj.offsetTop;
      obj = obj.offsetParent;
    }
  }else if (obj.y){
    curtop += obj.y;
  }

  return curtop;
}
