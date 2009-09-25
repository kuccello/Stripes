$(document).ready( function() {
$('#file_structure').fileTree({
root: '/',
script: '/admin/site/'+site_pid+"/file_struct",
expandSpeed: 1000,
collapseSpeed: 1000,
multiFolder: false
}, function(file) {
alert(file);
});
});
