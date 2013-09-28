$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
    $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });
    $('#new_survey').click(function (e) {
      e.preventDefault();
      $(this).hide();
        var url = $(this).attr('href');

        $.get(url, function(response){
          $('.profile').append(response);
        });

    });
    $('.container').on('submit', '#new_survey_form', function(e) {
      e.preventDefault();

      var url = $(this).attr('action');
      var data = $(this).serialize();

      $.post(url, data, function(response) {
        $('tbody').append(response);
      });
      $(this).remove();
      $('#new_survey').show();
    });
});
