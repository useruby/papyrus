__DIR__ = File.dirname(__FILE__)

unless File.size? Papyrus::Settings.searchd_pid
  system "#{Papyrus::Settings.cmd} -c #{Papyrus::Settings.config_filename} --base_dir #{Papyrus::Settings::BASE_DIR} -i"
  system "#{Papyrus::Settings.cmd} -c #{Papyrus::Settings.config_filename} --base_dir #{Papyrus::Settings::BASE_DIR} -s"
end
