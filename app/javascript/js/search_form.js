$('.accordion-btn').on('click', function() {
  let body = $(this).next('.accordion-body');
  $(body).slideToggle();

  if($('.accordion-btn').hasClass('close')) {
    $('.accordion-btn').removeClass('close');
  } else {
    $('.accordion-btn').addClass('close');
  }
});
