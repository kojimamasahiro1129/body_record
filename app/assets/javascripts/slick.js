window.onload = function(){
    console.log("slick");
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
    $(".sample_select2" ).select2({
        width: 600,
        multiple: true
    });
}