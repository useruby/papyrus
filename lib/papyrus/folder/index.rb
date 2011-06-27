module Papyrus
  class Folder::Index < Riddle::Configuration::Index
    def initialize name
      source = Riddle::Configuration::XMLSource.new name, 'xmlpipe2'
      source.xmlpipe_command = "#{Papyrus::Settings.cmd} -c #{Papyrus::Settings.config_filename} -e #{name}"

      source.xmlpipe_command += " --samples_dir #{Papyrus::Settings::SAMPLES_DIR}" if defined?(Papyrus::Settings::SAMPLES_DIR)

      super name, source

      @path = "#{Papyrus::Settings.indexes_root}/#{name}"
      @charset_type = 'utf-8'
    end
  end
end
