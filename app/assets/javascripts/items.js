$(function(){
  // 文字カウントしてみた
  $("#description").on('keyup',function(){
    $(".style-counter").text($(this).val().length + '/1000');
  });

