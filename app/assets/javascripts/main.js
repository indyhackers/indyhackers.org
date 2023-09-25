$(document).ready(function() {
  $('form.new_job_post_request, form.new_job, form.edit_job, #sign_in form').superLabels({
    labelLeft: 10,
    labelTop: 10
  });
});


document.addEventListener('DOMContentLoaded', function() {
  // Job title preview
  document.querySelectorAll('input.job_title, input.job_company').forEach(function(elm) {
      elm.addEventListener('keyup', function(event) {
      var name = document.querySelector('input.job_title').value + " at " + document.querySelector('input.job_company').value;
      document.querySelector('#single-job.job.readable h1').textContent = name;
    });
  });

  // Markdown preview
  document.querySelectorAll('textarea#job_description, textarea#job_post_request_description').forEach(function(elm) {
    elm.addEventListener('keyup', function(event) {
      var text = event.target.value;
      var converter = new Showdown.converter();
      var html = converter.makeHtml(text);
      document.querySelector('#markdown-target').innerHTML = html;
    });
  });

  // Tab logic
  document.querySelectorAll('.tab-container').forEach(function(elm) {
    if (!elm.classList.contains('active')) {
      elm.style.display = 'none';
    }
  });
  document.querySelectorAll('ul.tab-menu li').forEach(function(tabElm, tabIndex) {
    tabElm.addEventListener('click', function(event) {
      event.preventDefault();
      document.querySelectorAll('ul.tab-menu li').forEach(function(tabElm2) {
        if (tabElm === tabElm2) {
          tabElm2.classList.add('active');
        } else {
          tabElm2.classList.remove('active');
        }
      });

      document.querySelectorAll('.tab-container').forEach(function(containerElm, containerIndex) {
        if (tabIndex === containerIndex) {
          containerElm.classList.add('active');
          containerElm.style.display = 'block';
        } else {
          containerElm.classList.remove('active');
          containerElm.style.display = 'none';
        }
      });
    });
  });
});
