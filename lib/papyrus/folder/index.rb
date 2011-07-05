module Papyrus
  class Folder::Index < Riddle::Configuration::Index
    def initialize name
      source = Riddle::Configuration::XMLSource.new name, 'xmlpipe2'
      
      if Papyrus::Settings.cmd
        source.xmlpipe_command = "#{Papyrus::Settings.cmd} -c #{Papyrus::Settings.config_filename} -e #{name}"
        source.xmlpipe_command += " --base_dir #{Papyrus::Settings::BASE_DIR}" if defined?(Papyrus::Settings::BASE_DIR)
      end

      super name, source

      @path = "#{Papyrus::Settings.indexes_root}/#{name}"
      @charset_type = 'utf-8'
    end
  end
end
