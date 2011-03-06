$(document).ready(function() {
  if (location.hash != '' && $('a[name=' + location.hash.replace(/#/, '') + ']').length) {
    $('a[name=' + location.hash.replace(/#/, '') + ']').parent().next().slideDown('slow');
    scrollTo($('a[name=' + location.hash.replace(/#/, '') + ']'));
  }
  $('.job h3 a').click(function(event) {
    var el = $(this);
    var anchorName = el.attr('name');
    event.stopImmediatePropagation();
    event.preventDefault();
    el.parent().next().slideToggle('slow', function() {
      if ($(this).is(':visible')) {
        scrollTo(el);
      }
    });
    // Remove the name so that setting the hash doesn't jump the page
    el.attr('name', '');
    location.hash = anchorName;
    el.attr('name', anchorName);
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

function scrollTo(element) {
  $('html,body').animate({scrollTop: element.offset().top},'slow');
}
