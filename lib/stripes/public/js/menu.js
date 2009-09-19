var timeout    = 500;
var closetimer = 0;
var ddmenuitem = 0;

function stripes_menu_open()
{  stripes_menu_canceltimer();
   stripes_menu_close();
   ddmenuitem = $(this).find('ul').css('visibility', 'visible');}

function stripes_menu_close()
{  if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');}

function stripes_menu_timer()
{  closetimer = window.setTimeout(stripes_menu_close, timeout);}

function stripes_menu_canceltimer()
{  if(closetimer)
   {  window.clearTimeout(closetimer);
      closetimer = null;}}

$(document).ready(function()
{  $('#stripes_menu > li').bind('mouseover', stripes_menu_open)
   $('#stripes_menu > li').bind('mouseout',  stripes_menu_timer)});

document.onclick = stripes_menu_close;
