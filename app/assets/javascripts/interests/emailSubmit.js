$(document).on('turbolinks:load', function() {
  emailSubmit();
});

function emailSubmit() {
  $('.email-submit').on('click', function(e) {
    e.preventDefault();
    var form = $('.new_interest');
    $.ajax({
      url: form.attr('action'),
      data: form.serialize(),
      type: 'POST',
      success: function() {
        fadeForm();
        $('.thanks').fadeIn( "slow", function() {
          // complete
        });
      },
      error: function() {
        var error = $('.error');
        error.text("Sorry, something went wrong. Please try again later.");
        error.show();
      }
    })
  })
}

function fadeForm() {
  formGroup = $('.form-group');
  formGroup.animate({
    opacity: 0
  }, 1000, function() {
    // complete
  });
}
