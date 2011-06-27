Papyrus::Settings.source "#{File.dirname(__FILE__)}/../samples/conf/papyrus.conf"
Papyrus::Settings::SAMPLES_DIR = "#{File.dirname(__FILE__).split('/')[0...-1].join('/')}/samples"
Papyrus::Settings.load!

Papyrus::Settings[:config_filename] = "#{File.dirname(__FILE__)}/../samples/conf/papyrus.conf"
Papyrus::Settings[:cmd] = "#{File.dirname(__FILE__)}/../../bin/papyrus"
