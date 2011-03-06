$(document).ready(function() {
  if (location.hash != '' && $('a[name=' + location.hash.replace(/#/, '') + ']').length) {
    $('a[name=' + location.hash.replace(/#/, '') + ']').parent().next().slideDown('slow');
  }
  $('.job h3 a').click(function(event) {
    var anchorName = $(this).attr('name');
    event.stopImmediatePropagation();
    event.preventDefault();
    $(this).parent().next().slideToggle('slow');
    // Remove the name so that setting the hash doesn't jump the page
    $(this).attr('name', '');
    location.hash = anchorName;
    $(this).attr('name', anchorName);
    // Animating the move or scroll to the element is better, I think.
    $('html,body').animate({scrollTop: $(this).offset().top},'slow');
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
