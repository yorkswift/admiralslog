
introEnded = function(){
    
    $('.modules').removeClass('hidden');
   
}

radioSelect = function($id){
     $('#'+$id).prop("checked", true);
     $('.modules__start').click();
}
