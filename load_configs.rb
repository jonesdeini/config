ConfigFile = Struct.new(:dest_path, :filename, :source_path, :strategy)

def symlink(dest_path, source_path)
  File.symlink(File.expand_path(source_path), (File.expand_path(dest_path)))
rescue Errno::EEXIST
  puts "#{dest_path} exists!"
end

def write_config_to_file(dest_path, file_contents)
  # TODO check if file exists and prompt user to overwrite
  unless File.exists? File.expand_path(dest_path)
    f = File.new(File.expand_path(dest_path), "w+")
    f << file_contents
    # TODO handle permissions
    f.chmod(0600) if dest_path == "~/.pgpass"
  end
end

def main
  config_files = [ConfigFile.new("~/.ackrc", ".ackrc", "~/config/.ackrc", { "symlink" => nil }),
                  ConfigFile.new("~/.bashrc", ".bashrc", "~/config/.bashrc", { "symlink" => nil }),
                  ConfigFile.new("~/.gitconfig", ".gitconfig", "~/config/.gitconfig", { "symlink" => nil }),
                  ConfigFile.new("~/.irbrc", ".irbrc", "~/config/.irbrc", { "symlink" => nil }),
                  ConfigFile.new("~/.pgpass", ".pgpass", nil, { "write" => "*:*:*:*:\"\"" }),
                  ConfigFile.new("~/.vimrc", ".vimrc", "~/config/.vimrc", { "symlink" => nil })]

  config_files.each do |file|
    # TODO this is so ugly and brittle
    if file.strategy.keys.first == "symlink"
      symlink file.dest_path, file.source_path
    elsif file.strategy.keys.first == "write"
      write_config_to_file file.dest_path, file.strategy.values.first
    end
    puts "#{file.strategy.keys.first} #{file.filename}"
  end
  Dir.mkdir(File.join(Dir.home,"bin")) unless Dir.exists?(File.join(Dir.home, "bin"))
end

main
