function src_get_correct_answer()
{
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

                if(d[3] == "Makanan")
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
    }

    return candidate;
}