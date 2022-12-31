$(document).on('turbolinks:load', function() {
  console.log('fadeToggle.js loaded')
  $('#addresses-link').click(function() {
    $('#addresses-section').fadeToggle();
    return false; // prevent page reload
  });

  $('#emails-link').click(function() {
    $('#emails-section').fadeToggle();
    return false; // prevent page reload
  });

  $('#phone-numbers-link').click(function() {
    $('#phone-numbers-section').fadeToggle();
    return false; // prevent page reload
  });
});