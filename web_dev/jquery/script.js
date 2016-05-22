$(document).ready(function() {

  function toggleCollapse(event) {
    $(".collapsee").toggle();
  }

  // $(".collapsor").each(function() {
  //   $(this).addEventListener("click", toggleCollapse);
  // });
  $(".collapsor")[0].addEventListener("click", toggleCollapse);

  var rainbow = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"];
  var i = 0;
  setInterval(function() {
    // $(".super-special").each(function() {
    //   $(this).style.color = rainbow[i%7];
    // });
    $(".super-special")[0].style.color = rainbow[i%7];
    i++;
  }, 1000);

});
