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

          $('#new_survey2').submit(function(e) {
    
          e.preventDefault();
          $(this).hide();
          var url = $(this).attr('action');
          var data = $(this).serialize();
          // console.log(url);
          // console.log(data);
            $.post(url, data, function(response) {
            window.alert(response);
            $('.profile').append(response);
            });
          });
        });
   });
    // $('#test').submit(function(e) {
    //   console.log(e);
    //   e.preventDefault();
    //   $(this).hide();

    //   var url = $(this).attr('action');
    //   var data = $(this).serialize();
    //   console.log(url);
    //   console.log(data);
      // $.post(url, data, function(response) {
      //   window.alert(response)
      //   $('.profile').append(response);
      // });
      // // $(this).remove();
      // $('create_survey').show();
    // });

    $('#create_survey').submit(function(e) {
      e.preventDefault();
      $(this).hide();
      
      var url = $(this).attr('action');
      var data = $(this).serialize();
      
      $.post(url, data, function(response) {
        $('.profile').append(response);
      });
      // $(this).remove();
      // $('#new_survey').show();
    });

});
