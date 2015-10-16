$(document).ready(function() {
  $("#show-form").click(function(){
    $(".add-more").show();
    $(".add-btn").show();
  });

  $("#hide-form").click(function(){
      $(".add-more").hide();
      $(".add-btn").hide();
  });
});
