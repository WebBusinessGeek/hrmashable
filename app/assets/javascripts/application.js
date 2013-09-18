// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require_tree .

$(function() {
  $('.left-blog-holder').mouseover(function() {
    $(this).find('.left-blog-sharing').css('visibility', 'visible');
    $(this).find('.left-blog-shares').css('visibility', 'hidden');
  });
  $('.left-blog-holder').mouseout(function() {
    $(this).find('.left-blog-sharing').css('visibility', 'hidden');
    $(this).find('.left-blog-shares').css('visibility', 'visible');
  });
  $('.blog-holder').mouseover(function() {
    $(this).find('.blog-sharing').css('visibility', 'visible');
    $(this).find('.blog-shares').css('visibility', 'hidden');
  });
  $('.blog-holder').mouseout(function() {
    $(this).find('.blog-sharing').css('visibility', 'hidden');
    $(this).find('.blog-shares').css('visibility', 'visible');
  });
});
