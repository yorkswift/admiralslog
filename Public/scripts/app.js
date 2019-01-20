
introEnded = function(){
    
    $('.modules').show();
   
}

radioSelect = function($id){
     $('#'+$id).prop("checked", true);
     $('.modules__start').click();
}
