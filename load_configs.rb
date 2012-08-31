RCS = {
        ".pgpass" => "*:*:*:*:\"\"",
        ".irbrc" => "load '~/config/.irbrc'",
        ".vimrc" => "source ~/config/.vimrc",
        ".bashrc" => "source ~/config/.bashrc"
}

def do_things
  RCS.each do |k,v|
    write_config_to_file k,v if find_or_create_file k
  end
end

def find_or_create_file(file)
  f = File.open file
  unless f
    # create the file
    #File.new file
    return true
  end
  return false
end

def write_config_to_file(file, config)
  # create
  f = File.open file
  f << config
  f.save
end

# also need to chmod 600 ~/.pgpass

do_things
