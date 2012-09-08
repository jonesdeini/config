RCS = {
        "~/.pgpass" => "*:*:*:*:\"\"",
        "~/.irbrc" => "load '~/config/.irbrc'",
        "~/.vimrc" => "source ~/config/.vimrc",
        "~/.bashrc" => "source ~/config/.bashrc"
}

def do_things
  RCS.each do |k,v|
    write_config_to_file k,v unless File.exists?(File.expand_path(k))
  end
end

def write_config_to_file(file, config)
  # create
  f = File.new(File.expand_path(file), "w+")
  f << config
  f.chmod(0600) if file == "~/.pgpass"
end

do_things
