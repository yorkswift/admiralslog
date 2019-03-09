
var audio;

function preloadAudio(){

    if(audio_url){
        audio = new Audio(audio_url);
    }
}

$( document ).ready(function() {

    preloadAudio();

    $('#audio__control').on("click", function () {

        if(audio){
            
            if ($(this).hasClass('audio__control-play')) {

                $(this).removeClass('audio__control-play');
                $(this).addClass('audio__control-pause');

                $(this).find('.audio__state').html('PAUSE');

                audio.play();
            } else {
        
                $(this).removeClass('audio__control-pause');
                $(this).addClass('audio__control-play');

                $(this).find('.audio__state').html('PLAY');

                audio.pause();
            }
        }
    });
    if(audio){
        audio.onended = function () {
            
            $("#audio__control").removeClass('audio__control-pause');
            $("#audio__control").addClass('audio__control-play');
        
        };
    }

});
