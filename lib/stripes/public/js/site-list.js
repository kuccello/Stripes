$(document).ready(function(){
    rows = $("#sites_table tr.site_row");
    console.log("I found "+rows.length+" rows");
    $.each(rows,function(i,v){
        pid = v.id.replace("site|","");
        console.log("Working on "+pid);
        $(v).click(function(){
            console.log("going to set window.location = /admin/site/"+pid);
            window.location = "/admin/site/"+pid;            
        });
    });
});
