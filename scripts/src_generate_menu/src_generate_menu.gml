function src_generate_menu()
{
    menu_data = [];

    while(array_length(menu_data) < 5)
    {
        var item = "";

        switch(irandom(2))
        {
            case 0:
                item =
                global.pool_minuman[
                    irandom(array_length(global.pool_minuman)-1)
                ];
            break;

            case 1:
                item =
                global.pool_makanan[
                    irandom(array_length(global.pool_makanan)-1)
                ];
            break;

            case 2:
                item =
                global.pool_cemilan[
                    irandom(array_length(global.pool_cemilan)-1)
                ];
            break;
        }

        if(!array_contains(menu_data,item))
        {
            array_push(menu_data,item);
        }
    }
original_menu_data = [];

for(var i=0;i<array_length(menu_data);i++)
{
    array_push(
        original_menu_data,
        menu_data[i]
    );
}
    src_shuffle_menu();
}