module Papyrus
  module Sphinx
    class Config < Riddle::Configuration
      def initialize
        super

        @searchd.log = Papyrus::Settings.searchd_log
        @searchd.query_log = Papyrus::Settings.query_log
        @searchd.port = Papyrus::Settings.searchd_port
        @searchd.pid_file = Papyrus::Settings.searchd_pid

        Papyrus::Folder.all.each do |folder|
          @indexes << folder.index
        end
      end

      def self.generate
        config = Papyrus::Sphinx::Config.new

        sphinx_conf_dir = File.dirname Papyrus::Settings.sphinx_conf
        Dir.mkdir sphinx_conf_dir unless File.exist? sphinx_conf_dir

        File.open Papyrus::Settings.sphinx_conf, 'w' do |sphinx_conf_file| 
          sphinx_conf_file.write config.render
        end
      end
    end
  end
end
