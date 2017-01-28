$(document).ready(function() {
  setTimeout(function(){
    $(".flash").fadeOut("slow", function() {
      $(this).remove();
    })
  }, 4500);
});
