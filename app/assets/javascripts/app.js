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
    if (el.parent().next().is(':hidden')) {
      $.post(el.attr('href') + '/viewed');
    }

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

  $('textarea#job_description, textarea#job_post_request_description').keyup(function(event) {
    var text = $(this).attr('value');
    var converter = new Showdown.converter();
    var html = converter.makeHtml(text);
    $('#markdown-target').html(html);
  });

  $('input#job_title, input#job_post_request_title').keyup(function(event) {
    $('.job.readable h3 > a').text($(this).attr('value'));
  });
});

function scrollTo(element) {
  $('html,body').animate({scrollTop: element.offset().top},'slow');
}
