function src_draw_text_outline_ext(_x, _y, _text, _line_sep, _wrap, _color)
{
    draw_set_color(c_black);

    draw_text_ext(_x - 1, _y,     _text, _line_sep, _wrap);
    draw_text_ext(_x + 1, _y,     _text, _line_sep, _wrap);
    draw_text_ext(_x,     _y - 1, _text, _line_sep, _wrap);
    draw_text_ext(_x,     _y + 1, _text, _line_sep, _wrap);

    draw_set_color(_color);

    draw_text_ext(_x, _y, _text, _line_sep, _wrap);
}