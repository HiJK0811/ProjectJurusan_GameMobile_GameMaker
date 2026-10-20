///@arg cutscene
///@arg actor
///@arg atype
///@arg [data]
///@arg text

///args
var  _cts=argument[0];
var _actor=argument[1];
var _atype=argument[2];
var _data=argument[3];
var _text = argument[4];

/// init
if (!variable_global_exists("ctsAnims")) {
    global.ctsAnims = ds_map_create();
}

/// ensure key exists
if (!ds_map_exists(global.ctsAnims, _cts)) {
    global.ctsAnims[? _cts] = [];
}

/// size
var size = array_length(global.ctsAnims[? _cts]);

function addAnims(_cts,_actor,_atype,_data,_text) {

    if (!variable_global_exists("ctsAnims")) {
        global.ctsAnims = [];
    }

    if (_cts >= array_length(global.ctsAnims)) {
        global.ctsAnims[_cts] = [];
    }

    var size = array_length(global.ctsAnims[_cts]);
    global.ctsAnims[_cts][size] = [_actor,_atype,_data,_text];
}