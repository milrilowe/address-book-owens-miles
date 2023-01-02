$(document).on('turbolinks:load', function() {
  console.log('fadeToggle.js loaded')
  $('#addresses-heading').click(function() {
    $('#addresses-section').fadeToggle();
    return false; // prevent page reload
  });

  $('#emails-heading').click(function() {
    $('#emails-section').fadeToggle();
    return false; // prevent page reload
  });

  $('#phone-numbers-heading').click(function() {
    $('#phone-numbers-section').fadeToggle();
    return false; // prevent page reload
  });
});