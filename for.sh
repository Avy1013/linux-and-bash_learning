my_first_list=(one two three four five) # array in bash
for item in ${my_first_list[@]}; do echo $item; done    # -n after echo flag can be used for ignoring /n 
#| wc -c;                                           
