def symlink(dest_path, source_path)
  File.symlink(File.expand_path(dest_path), (File.expand_path(source_path)))
end

def write_config_to_file(dest_path, file_contents)
  # TODO check if file exists and prompt user to overwrite
  unless File.expand_path(dest_path).exists?
    f = File.new(File.expand_path(dest_path), "w+")
    f << file_contents
    # TODO handle permissions
    f.chmod(0600) if dest_path == "~/.pgpass"
  end
end

def main
  ConfigFile = Struct.new(:dest_path, :filename, :source_path, :strategy)
  config_files << ConfigFile.new("~/.ackrc", ".ackrc", "~/config/.ackrc", { "symlink" => nil })
  config_files << ConfigFile.new("~/.bashrc", ".bashrc", "~/config/.bashrc", { "symlink" => nil })
  config_files << ConfigFile.new("~/.irbrc", ".irbrc", "~/config/.irbrc", { "symlink" => nil })
  config_files << ConfigFile.new("~/.pgpass", ".pgpass", nil, { "write" => "*:*:*:*:\"\"" })
  config_files << ConfigFile.new("~/.vimrc", ".vimrc", "~/config/.vimrc", { "symlink" => nil })

  config_files.each do |file|
    # TODO this is so ugly and brittle
    if file.strategy.keys.first == "symlink"
      symlink file.dest_path file.source_path
    elsif file.strategy.keys.first == "write"
      write_config_to_file file.dest_path, file.strategy.values.first
    end
    puts "#{strategy.keys.first} #{filename}"
  end
  Dir.mkdir(File.join(Dir.home,"bin")) unless Dir.exists?(File.join(Dir.home, "bin"))
end

main
