$(document).ready(function() {
  $('textarea').elastic();
  $('form.new_job_post_request, form.new_job, form.edit_job, #sign_in form').superLabels({
    labelLeft: 10,
    labelTop: 10
  });

  $('textarea#job_description, textarea#job_post_request_description').keyup(function(event) {
    var text = $(this).val();
    var converter = new Showdown.converter();
    var html = converter.makeHtml(text);
    $('#markdown-target').html(html);
  });

  $('input.job_title, input.job_company').keyup(function(event) {
    var name = $('input.job_title').val() + " at " + $('input.job_company').val();
    $('#single-job.job.readable h1').text(name);
  });

  $('.tab-container').not('.active').hide();
  $("ul.tab-menu li").click(function (ev) {
    ev.preventDefault();
    $('ul.tab-menu li').removeClass('active');
    $(this).addClass('active');
    $('.tab-container').hide().eq($(this).index()).show();
  });
});
