require 'thread'
require 'guard'
require 'guard/guard'
require 'spinoff/client'
require 'spinoff/server'

module Guard
  class Spinoff < Guard
    class Runner
      attr_reader :options

      def initialize(options = {})
        Thread.abort_on_exception = true
        @options = options
        @config = init_config(@options)
        UI.info 'Guard::Spinoff Initialized'
      end

      def launch(action)
        UI.info "#{action}ing Spinoff", :reset => true
        start_server
      end

      def kill
        @server.kill if @server
      end

      def run(paths)
        ::Spinoff::Client.start(Array(paths))
      end

      def run_all
        if rspec?
          run('spec')
        elsif test_unit?
          run('test')
        end
      end

      private
      def init_config(options)
        {}.tap do |config|
          config[:init_script] = options[:init]
          config[:test_framework] = :rspec if rspec?
          config[:test_framework] = :testunit if test_unit?
        end
      end

      def start_server
        unless @config[:test_framework]
          raise "No :runner guard option set!"
        end

        @server ||= Thread.new do
          ::Spinoff::Server.start(@config)
        end
      end

      def rspec?
        options[:runner] == :rspec
      end

      def test_unit?
        options[:runner] == :test_unit
      end
    end
  end
end
