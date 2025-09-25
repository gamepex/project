$(function(){

   $('#main-menu > li ').mouseenter(function(){
      $(this).find('.sub-menu').stop().slideDown();
    });

       $('#main-menu >li ').mouseleave(function(){
       $(this).find('.sub-menu').stop().slideUp();
     });
});