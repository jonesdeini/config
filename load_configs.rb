RCS = {
        "~/.pgpass" => "*:*:*:*:\"\"",
        "~/.irbrc"  => "load '~/config/.irbrc'",
        "~/.vimrc"  => "source ~/config/.vimrc",
        "~/.bashrc" => "source ~/config/.bashrc"
}

def do_things
  RCS.each do |k,v|
    # TODO if file exist, output file to user and ask to be overwritten
    write_config_to_file k,v unless File.exists?(File.expand_path(k))
  end
  Dir.mkdir(File.join(Dir.home,"bin")) unless Dir.exists?(File.join(Dir.home, "bin"))
  symlink_ackrc
end

def symlink_ackrc
  File.symlink(File.expand_path(".ackrc"), (File.expand_path("~/.ackrc")))
end

def write_config_to_file(file, config)
  f = File.new(File.expand_path(file), "w+")
  f << config
  f.chmod(0600) if file == "~/.pgpass"
end

do_things
