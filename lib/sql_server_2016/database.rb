module SqlServer2016
  class Database
    attr_reader :db

    def initialize
      @db = {}

      init_event_store
      init_reacraft
    end

    def events
      db[:events]
    end

    private

    def init_event_store
      db[:events] = {}
    end

    def init_reacraft
      events[:level]  = []
      events[:health] = []
    end
  end
end

module Kernel
  def silence_warnings
    original_verbose, $VERBOSE = $VERBOSE, nil

    yield

    $VERBOSE = original_verbose
  end
end
