$(function () {
  $('#openFeedbackForm').click(function(){
      $('#modalFormArea').fadeIn();
  });
  $('#closeModalForm , #modalFormBg').click(function(){
    $('#modalFormArea').fadeOut();
  });
});
