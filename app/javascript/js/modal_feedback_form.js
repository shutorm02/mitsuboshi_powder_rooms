$(function () {
  $('#openFeedbackForm').click(function(){
      $('#modalArea').fadeIn();
  });
  $('#closeModal , #modalBg').click(function(){
    $('#modalArea').fadeOut();
  });
});
