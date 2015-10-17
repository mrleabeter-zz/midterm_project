$(document).ready(function() {

  $('.modal-trigger').leanModal();

  $(".show-add-restriction-form").click(function(event){
    var discountId = $(this).attr("data-id");
    var actionUrl = "/user/" + discountId + "/restriction";
    $(".add-more-restrictions").attr("action", actionUrl);
    $(".add-more-restrictions").show();
    $(".add-btn").show();
  });

  $(".hide-add-restriction-form").click(function(){
      $(".add-more-restrictions").hide();
      $(".add-btn").hide();
  });
  
  $("#show-add-discount-form").click(function(){
    $(".add-more-discounts").show();
    $(".add-btn").show();
  });

  $("#hide-add-discount-form").click(function(){
      $(".add-more-discounts").hide();
      $(".add-btn").hide();
  });

});
