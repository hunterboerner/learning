def recursive_dir(source_file)
  if File.directory?(source_file)
    Dir.foreach(source_file) do |source_file_b|
      source_file_b = File.join(source_file, source_file_b)
      if File.directory?(source_file_b)
        if !source_file_b.to_s.end_with?(".") && !source_file_b.to_s.end_with?("..")
          recursive_dir(source_file_b)
        end
      elsif File.open(source_file_b).read.encoding.name != "UTF-8"
        puts "#{File.basename(source_file_b)} encoded with #{File.open(source_file_b).read.encoding}"        
      end      
    end
  else
    puts "#{File.basename(source_file)} encoded with #{File.open(source_file).read.encoding}"
  end
end

ARGV.each do |source_file|
  recursive_dir source_file
end

