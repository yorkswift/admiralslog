
var fallbackIntroTimer;

introEnded = function(){
    
    if($('.modules').hasClass('hidden')){

        $('body').addClass('background__lab');
        $('.lab__video').addClass('hidden');
        $('.modules').removeClass('hidden');
        clearIntroTimer();
    }
   
}

introStarted = function(){
    clearIntroTimer();
}

clearIntroTimer = function(){
    if(fallbackIntroTimer){
        clearInterval(fallbackIntroTimer);
    }
}

$( document ).ready(function() {

    fallbackIntroTimer = setInterval(function(){ introEnded(); }, 7000);

});
