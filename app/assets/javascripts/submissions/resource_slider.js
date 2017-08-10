$(document).on('turbolinks:load', function() {
  console.log('start slider');
  startSlider();
})

function startSlider() {
    $('.carousel.carousel-slider').carousel({fullWidth: true});
}
