// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

/* global $ */
$(document).on('turbolinks:load', function () {
  $(document).on('click', '#open', function(){
    $('#modal').removeClass('hidden');
    $('#mask').removeClass('hidden');
  });

  $('.tab').hover(function () {
    var index = $('.tab').index(this);
    $('.tab').removeClass('current');
    $(this).addClass('current');
    $('.menu-box').hide().eq(index).fadeIn();
  }, function() {
    $(this).removeClass('current');
    $('.menu-box').hide();
  });

  $('.menu').hover(function () {
    $(this).addClass('current');
  }, function () {
    $(this).removeClass('current');
  });

  $('.menu-box').hover(function () {
    var index = $('.menu-box').index(this);
    $('.tab').eq(index).addClass('current');
    $(this).show();
  }, function () {
    $('.tab').removeClass('current');
    $(this).hide();
    });

  $(document).on('click', '.menu', function () {
    $('.menu-box').hide();
  });

});
