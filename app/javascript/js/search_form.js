$('.accordion-btn').on('click', function() {
  let body = $(this).next('.accordion-body');
  $(body).slideToggle();

  if($(body).hasClass('hidden')) {
    $(body).removeClass('hidden');
  } else {
    $(body).addClass('hidden');
  }
});
