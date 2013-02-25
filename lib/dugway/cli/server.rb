require 'rack'

module Dugway
  module Cli
    class Server < Thor::Group
      include Thor::Actions
      
      class_option :host,
        :type    => :string,
        :aliases => '-h',
        :default => '0.0.0.0',
        :desc    => 'The host address to bind to'
      
      class_option :port,
        :type    => :numeric,
        :aliases => '-p',
        :default => 9292,
        :desc    => "The port address to bind to"
      
      def start
        Rack::Server.start({
          :config => File.join(Dir.pwd, 'config.ru'),
          :Host => options[:host],
          :Port => options[:port]
        })
      end
    end
  end
end