file_names =  Dir.glob("#{__dir__}/migrate/*.rb")

def take_int_from(file_migration)
	file_migration.split('/')[-1].split('_')[0]
end

file_names.each do |file_name|
	int_migrate = take_int_from(file_name)
	new_int_migrate = (take_int_from(file_name).to_i + 1).to_s

	p new_file_name = file_name.sub(int_migrate, new_int_migrate)
	File.rename(file_name, new_file_name)
end
