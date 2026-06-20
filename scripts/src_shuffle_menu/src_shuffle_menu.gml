function src_shuffle_menu(){
	/// @function src_shuffle_menu()

for(var i=0;i<100;i++)
{
    var a =
        irandom(array_length(menu_data)-1);

    var b =
        irandom(array_length(menu_data)-1);

    var temp =
        menu_data[a];

    menu_data[a] =
        menu_data[b];

    menu_data[b] =
        temp;
}

}