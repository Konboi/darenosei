table_names = %w()

table_names.each do |table_name|
  p table_name
  path = "#{Rails.root}/db/seeds/#{Rails.env}/#{table_name}.rb"
  require(path) if File.exist?(path)
end
