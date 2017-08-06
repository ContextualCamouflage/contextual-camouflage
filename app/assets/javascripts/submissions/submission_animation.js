$(document).ready(function() {
  animateToAnecdote();
});

// function animateToAnecdote() {
//   $("[data-next-form]").bind("click", function(e, evt) {
//     e.preventDefault();
//     var $el = $(evt.currentTarget).attr($("data-next-form"));
//     $el.show();
//     $('html,body,.submission-form.anecdote').animate({
//   scrollTop: $el.offset().top - ( $(window).height() - $el.outerHeight(true) ) / 2
// }, 200);
//   });
// }

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

        // $cur.removeClass('active');
        // $el.addClass('active');
    });
}
