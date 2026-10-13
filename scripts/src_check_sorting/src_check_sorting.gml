function src_check_sorting()
{
    var ascending =
    (
        requirement == "MINUMAN_TERMURAH" ||
        requirement == "CEMILAN_TERMURAH" ||
        requirement == "MAKANAN_TERMURAH"
    );

    for(var i=0;i<array_length(menu_data)-1;i++)
    {
        var d1 = string_split(menu_data[i], "|");
        var d2 = string_split(menu_data[i+1], "|");

        var p1 = real(d1[1]);
        var p2 = real(d2[1]);

        if(ascending)
        {
            if(p1 > p2)
            {
                return false;
            }
        }
        else
        {
            if(p1 < p2)
            {
                return false;
            }
        }
    }

    return true;
}