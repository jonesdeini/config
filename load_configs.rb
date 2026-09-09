require 'fileutils'

ConfigFile = Struct.new(:dest_path, :filename, :source_path)

def symlink(dest_path, source_path)
  expanded_dest = File.expand_path(dest_path)
  FileUtils.mkdir_p(File.dirname(expanded_dest))
  File.symlink(File.expand_path(source_path), expanded_dest)
rescue Errno::EEXIST
  puts "#{dest_path} exists!"
end

def main
  # NOTE bash_profile is unlikely to change
  config_files = [ConfigFile.new("~/.bashrc", ".bashrc", "~/config/jonesdeini/.bashrc"),
                  ConfigFile.new("~/.bash_profile", ".bash_profile", "~/config/jonesdeini/.bash_profile"),
                  ConfigFile.new("~/.gitconfig", ".gitconfig", "~/config/jonesdeini/.gitconfig"),
                  ConfigFile.new("~/.vimrc", ".vimrc", "~/config/jonesdeini/.vimrc"),
                  ConfigFile.new("~/.config/kitty/kitty.conf", "kitty.conf", "~/config/jonesdeini/.config/kitty/kitty.conf")]

  config_files.each do |file|
    symlink file.dest_path, file.source_path
    puts "symlink #{file.filename}"
  end
end

main
