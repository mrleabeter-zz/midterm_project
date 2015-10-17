$(document).ready(function() {

  $('.modal-trigger').leanModal();

  $("#show-form").click(function(){
    $(".add-more").show();
    $(".add-btn").show();
  });

  $("#hide-form").click(function(){
      $(".add-more").hide();
      $(".add-btn").hide();
  });

});
