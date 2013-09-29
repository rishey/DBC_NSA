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
        var url = $(this).attr('action');

        $.get(url, function(response){
          $('#participant_surveys').hide();
          $('#created_surveys').hide();
          $('.profile').append(response);
          
          $('#create_new_survey').submit(function(e) {
            e.preventDefault();
            $(".new_survey_container").hide();
            var url = $(this).attr('action');
            var data = $(this).serialize();

            $.post(url, data, function(response) {
              $('.profile').append(response);

              $('#build_survey').submit(function(e) {
                e.preventDefault();
                $(".new_survey_container").hide();
      
                var url = $(this).attr('action');
                var data = $(this).serialize();
      
                $.post(url, data, function(response) {
                  $('.profile').append(response);
                });
              });
            });
          });
        });
   });

  

  $("#survey_take").submit(function(e){
    e.preventDefault();
    $("#profile div").slideUp();

    var url = $(this).attr('action');
    
    
    $.get(url, function(response){
      $(response).appendTo('.for_new_survey');
      $('#next_button').append($('<a href="/next_question" id="question_next">Next Question</a>'));
      $("#profile div:last-child").slideDown();

      $("#participant_survey div:first-child").addClass("current_question");
      for (var)
      $('.current_question').show(); 

      $('#question_next').click(function (e) {
        e.preventDefault();
       
        $('#participant_survey > div.current_question').removeClass('current_question').next("div").addClass('current_question')



      $("#participant_survey").submit(function(e){
        e.preventDefault();
        var url = $(this).attr('action');
        var form_data = $(this).serialize();

        $.ajax({
          type: "POST",
          url: url,
          data: form_data,
          success: function(response){
            $("#profile div:last-child").html(response);
        }
        });
      });
      })
    });
  });

});
