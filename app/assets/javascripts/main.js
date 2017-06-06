$(document).ready(function() {

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
    var text = $(this).val();
    var converter = new Showdown.converter();
    var html = converter.makeHtml(text);
    $('#markdown-target').html(html);
  });

  $('#new-blog-post textarea#post_body').keyup(function(event) {
    var title = $('input#post_title').val();
    var text = $(this).val();
    var converter = new Showdown.converter();
    var html = converter.makeHtml(text);
    $('#preview article').html("<h1>" + title + "</h1>" + html);
  });

  $('input#job_title, input#job_post_request_title').keyup(function(event) {
    $('.job.readable h3 > a').text($(this).val());
  });

  $('input#post_title').keyup(function(event) {
    $('#preview article h1').text($(this).val());
  });
});
