$(document).on('turbolinks:load', function() {
  animateForm();
  submitForm();
  submitAndResetForm();
});

function animateForm() {
  var current = "research";
    $("[data-next-form]").on('click', function (evt) {
        var el = $(evt.currentTarget).attr('data-next-form');
        if (el === current) return;

        var $el = $("." + el);
        var $cur = $("#" + current);
        current = el;
        $el.show();
        $("html, body").animate({
          scrollTop: $el.offset().top - ( $(window).height() - $el.outerHeight(true) ) / 2
        }, 200);
        $($el).animate({
          scrollTop: $el.offset().top - ( $(window).height() - $el.outerHeight(true) ) / 2
        }, 200);
    });
}

function submitAndResetForm() {
  animateForm();
  $('.submission-form').on('submit', function(e) {
    e.preventDefault();
    $('.submission-form').each(function() {
      $(this).hide();
      $(this)[0].reset();
    });
  });
}

function submitForm(form) {
  animateForm();
  $("[data-this-form]").on("click", function(evt) {
    var formName = $(evt.currentTarget).attr("data-this-form");
    var form = $("#new_" + formName);
    submitAjax(form);
  });
}

function submitAjax(form) {
  var formUrl = form.attr("action");
  $.ajax({
    type: "POST",
    url: formUrl,
    data: $(form).serialize(),
    success: function() {
      console.log("success");
    },
    error: function() {
      console.log("error");
    }
  });
}
