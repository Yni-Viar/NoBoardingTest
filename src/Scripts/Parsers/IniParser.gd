extends Object
class_name IniParser
## Loads INI
func load_ini(filename: String, chunk: String, chunk_data: Array[String]):
	var data: Array = []
	var config: ConfigFile = ConfigFile.new()
	
	var err = config.load(filename)
	if err != OK:
		printerr("No file was loaded - error.")
	
	for i in range(chunk_data.size()):
		data.append(config.get_value(chunk, chunk_data[i]))
	return data
## Saves INI file
func save_ini(chunk: String, names: Array[String], datas: Array, output: String):
	var config: ConfigFile = ConfigFile.new()
	
	for i in range(names.size()):
		config.set_value(chunk, names[i], datas[i])
	
	config.save(output)
