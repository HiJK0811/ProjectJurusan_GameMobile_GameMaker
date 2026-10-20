function src_dialog_show(_speaker, _pages, _options) {
    // 🔥 Jika jurnal sedang terbuka, cegah dialog agar tidak muncul menembus jurnal
    if (variable_global_exists("journal_open") && global.journal_open) {
        return noone; 
    }

    if (instance_exists(obj_dialog)) instance_destroy(obj_dialog);
    var _d = instance_create_depth(0, 0, -9999, obj_dialog);
    _d.speaker_name = _speaker;
    _d.pages        = _pages;
    _d.options      = _options;   
    _d.reset_page();
    global.dialog_active = true;
    return _d;
}