function save_file(struct,fname){
	var _saveData = struct
	var _string = json_stringify(_saveData,true)
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string,_string)
	buffer_save(_buffer,fname)
	buffer_delete(_buffer)
	
	//show_debug_message("game saved! "+_string)
}

function load_file(fname){
	//show_debug_message("loading save...")
	if(file_exists(fname))
	{
		
		var _buffer = buffer_load(fname)
		var _string = buffer_read(_buffer,buffer_string)
		buffer_delete(_buffer)

		var _loadData = json_parse(_string)
		//show_debug_message("game LOADED DIAPER! "+string(_loadData))
		return _loadData;
	}
	else
	{
		return false;
	}
}