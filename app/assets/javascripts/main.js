$(document).ready(function() {
  /**************************************************************************/
  /*	Template options													  */
  /**************************************************************************/

  var options = {
    supersized		:
      {
      slide		:
        [
          {image	: '/holiday-social-2012/image/background/01.jpg'},
      ]
    },
  }

  /**************************************************************************/
  /*	Supersized															  */
  /**************************************************************************/

  $.supersized(
    {
    slides					: options.supersized.slide,
    autoplay				: true,
    thumb_links				: false,
    start_slide				: 1,
    thumbnail_navigation	: false
  });

  /**************************************************************************/
  /*	Forms																  */
  /**************************************************************************/

  $('textarea').elastic();
  $('#job_post_request form label').inFieldLabels();
  $('#sign_in form label').inFieldLabels();

  if (location.hash != '' && $('section.jobs').length) {
    window.location.replace('/jobs/' + location.hash.replace(/#/, ''));
  }

  $('textarea#job_description, textarea#job_post_request_description').keyup(function(event) {
    var text = $(this).attr('value');
    var converter = new Showdown.converter();
    var html = converter.makeHtml(text);
    $('#markdown-target').html(html);
  });

  $('#new-blog-post textarea#post_body').keyup(function(event) {
    var title = $('input#post_title').attr('value');
    var text = $(this).attr('value');
    var converter = new Showdown.converter();
    var html = converter.makeHtml(text);
    $('#preview article').html("<h1>" + title + "</h1>" + html);
  });

  $('input#job_title, input#job_post_request_title').keyup(function(event) {
    $('.job.readable h3 > a').text($(this).attr('value'));
  });

  $('input#post_title').keyup(function(event) {
    $('#preview article h1').text($(this).attr('value'));
  });
});
