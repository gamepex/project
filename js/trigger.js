$(function(){
$('#trigger').click(function(e){
    e.preventDefault();
    $(this).toggleClass('tabmenu');
    $('#main-menu').toggleClass('tabmenu');
});
});


