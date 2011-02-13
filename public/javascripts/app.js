$(document).ready(function() {
  $('.job h3 a').click(function(event) {
    event.stopImmediatePropagation();
    event.preventDefault();
    $(this).parent().next().slideToggle('slow');
    return false;
  });

  $('.toggle-all a').click(function(event) {
    event.stopImmediatePropagation();
    event.preventDefault();

    if ($(this).html().match(/collapse/)) {
      $(this).html('+ expand all');
      $('.job-description').slideUp('slow');
    } else {
      $(this).html('- collapse all');
      $('.job-description').slideDown('slow');
    }
    return false;
  });
});
