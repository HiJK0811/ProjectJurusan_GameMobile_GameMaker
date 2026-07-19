function src_get_correct_answer()
{
	/*show_debug_message("Requirement = [" + requirement + "]");
	show_debug_message("===== MENU DATA =====");

for(var i = 0; i < array_length(menu_data); i++)
{
    show_debug_message(string(i) + " = " + menu_data[i]);
}

show_debug_message("=====================");*/
    var candidate = "";
    var best_price = 0;

    switch(requirement)
    {
        case "MINUMAN_TERMURAH":

            best_price = 999999;

            for(var i=0;i<array_length(menu_data);i++)
            {
                var d = string_split(menu_data[i],"|");

                if(d[3] == "Minuman")
                {
                    var price = real(d[1]);

                    if(price < best_price)
                    {
                        best_price = price;
                        candidate = menu_data[i];
                    }
                }
            }

        break;

        case "MINUMAN_TERMAHAL":

            best_price = -1;

            for(var i=0;i<array_length(menu_data);i++)
            {
                var d = string_split(menu_data[i],"|");

                if(d[3] == "Minuman")
                {
                    var price = real(d[1]);

                    if(price > best_price)
                    {
                        best_price = price;
                        candidate = menu_data[i];
                    }
                }
            }

        break;

        case "CEMILAN_TERMURAH":

            best_price = 999999;

            for(var i=0;i<array_length(menu_data);i++)
            {
                var d = string_split(menu_data[i],"|");

                if(d[3] == "Cemilan")
                {
                    var price = real(d[1]);

                    if(price < best_price)
                    {
                        best_price = price;
                        candidate = menu_data[i];
                    }
                }
            }

        break;

        case "CEMILAN_TERMAHAL":

            best_price = -1;

            for(var i=0;i<array_length(menu_data);i++)
            {
                var d = string_split(menu_data[i],"|");

                if(d[3] == "Cemilan")
                {
                    var price = real(d[1]);

                    if(price > best_price)
                    {
                        best_price = price;
                        candidate = menu_data[i];
                    }
                }
            }

        break;

        case "MAKANAN_TERMURAH":

            best_price = 999999;

            for(var i=0;i<array_length(menu_data);i++)
            {
                var d = string_split(menu_data[i],"|");

                if(d[3] == "Makanan")
                {
                    var price = real(d[1]);

                    if(price < best_price)
                    {
                        best_price = price;
                        candidate = menu_data[i];
                    }
                }
            }

        break;

        case "MAKANAN_TERMAHAL":

            best_price = -1;

            for(var i=0;i<array_length(menu_data);i++)
            {
                var d = string_split(menu_data[i],"|");

                if (string_trim(d[3]) == "Makanan")
{
    var price = real(string_trim(d[1]));

    show_debug_message("PRICE = " + string(price));
    show_debug_message("BEST  = " + string(best_price));

    if(price > best_price)
    {
        show_debug_message("MASUK");
        best_price = price;
        candidate = menu_data[i];
    }
}
            }

        break;
    }
show_debug_message("Candidate = [" + candidate + "]");
    return candidate;
}