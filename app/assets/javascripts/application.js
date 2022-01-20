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
$(function () {
  $(document).on('click', '#open', function(){
    $('#modal').removeClass('hidden');
    $('#mask').removeClass('hidden');
  });

  $(".menu-box").css("display", "none");
  //////////// タブの制御
  $('.tab').hover(function () { // タブメニューをhoverしたら
      var index = $('.tab').index(this); // hoverしたタブ番号を取得
      $('.tab').removeClass('current'); // タブ現在地クラスを削除し、
      $(this).addClass('current'); // hoverしたタブにタブ現在地クラスを付与
      //////////// コンテンツの制御
      $('.menu-box').hide().eq(index).fadeIn(); // hoverしてないコンテンツは非表示、hoverした番号は表示
    });

  $('.menu').hover(function () {
      $(this).addClass('current');
  }, function () {
    $(this).removeClass('current');
  });

  $('.menu-box').hover(function () {
    }, function () {
      $('.tab').removeClass('current');
      $(this).hide();
    });


  $('.tab').click(function () {
      $('.tab').removeClass('current');
      $('.menu-box').hide();
    });

});
