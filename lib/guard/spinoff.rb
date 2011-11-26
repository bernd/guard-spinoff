require 'guard'
require 'guard/guard'
require 'guard/spinoff/runner'

module Guard
  class Spinoff < Guard
    attr_reader :runner

    def initialize(watchers = [], options = {})
      super
      @runner = Runner.new(options)
    end

    def start
      runner.kill
      runner.launch('Start')
    end

    def stop
      runner.kill
    end

    def reload
      runner.kill
      runner.launch('Reload')
    end

    def run_all
      runner.run_all
    end

    def run_on_change(paths)
      runner.run(paths)
    end
  end
end
