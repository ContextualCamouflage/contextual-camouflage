$(document).on('turbolinks:load', function() {
  animateToAnecdote();
  submitForm();
});

function animateToAnecdote() {
  var current = "research";
    $("[data-next-form]").bind('click', function (evt) {
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

function submitForm(form) {
  $("[data-this-form]").bind("click", function(evt) {
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
