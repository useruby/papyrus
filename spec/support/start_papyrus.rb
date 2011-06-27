__DIR__ = File.dirname(__FILE__)

unless File.size? Papyrus::Settings.searchd_pid
  system "#{Papyrus::Settings.cmd} -c #{Papyrus::Settings.config_filename} --samples_dir #{Papyrus::Settings::SAMPLES_DIR} -i"
  system "#{Papyrus::Settings.cmd} -c #{Papyrus::Settings.config_filename} --samples_dir #{Papyrus::Settings::SAMPLES_DIR} -s"
end
