<?php

//php ./Source/generateModuleTypePermutations.php

$module_colours = [

    'yellow' => '#fdd97a',
    'green' => '#9dcb8c',
    'purple' => '#a088b8',
    'blue' => '#a5ddec',
    'orange' => '#f47f52'

];

$module_types = [
    'A'=>[
        'name'=>'Accommodation',
        'colour'=>'yellow'
    ],
    'D'=> [
        'name'=>'Defence',
        'colour'=>'green'
    ],
    'E'=>[
        'name'=>'Education',
        'colour'=>'purple'
    ],
    'I'=> [
        'name'=>'Infrastructure',
        'colour'=>'blue'
    ],
    'R'=> [
        'name'=>'Recreation',
        'colour'=>'orange'
    ],

];

function generateModuleTypePermutations($module_types){

    $list = array_keys($module_types);
    $i = 0; 

   $permutations = genPermutations($list, 4);

    $unique_permutations = [];
    foreach ($permutations as $permutation) {

        sort($permutation);
        $key = implode('', $permutation);
        if(!isset($unique_permutations[$key])){
            $unique_permutations[$key] = $permutation;
            echo $key . PHP_EOL;
            $i++;
        } 
        
    }
    
    echo $i . ' permutations' . PHP_EOL;

}

function genPermutations($values,$count=0) {
    
    $permCount = pow(count($values), $count);
    for ($i = 0; $i < $permCount; $i++) {
        yield getPermutation($values, $count, $i);
    }
}
  
function getPermutation($values, $count, $index) {
    
    $result = [];
    for($i = 0; $i < $count; $i++) {
      
      $pos = $index % count($values);
  
      $result[] = $values[$pos];
      $index = ($index-$pos)/count($values);
    }
    return $result;
}

generateModuleTypePermutations($module_types);