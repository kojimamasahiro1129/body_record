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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require chartkick
//= require Chart.bundle
//= require select2
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function() {
    // console.log("onload");
    $('.slick').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 1000,
    });
    
    $('.protain').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 500,
    });

    // console.log("select2 before");
    $(".sample_select2" ).select2({
        width: 600,
        multiple: true
    });
    // console.log("select2 after");
    
    
    $(document).ready(function() {
    // #(ハッシュ)指定されたタブを表示する
    var hashTabName = document.location.hash;
    // console.log(hashTabName)
    if (hashTabName == "#meal" || hashTabName == "#weight" || hashTabName == "#traning"){
        $('.nav-tabs a[href="#record"]').tab('show');
        $('.nav-tabs a[href="' + hashTabName + '"]').tab('show');
    }
    });


});



