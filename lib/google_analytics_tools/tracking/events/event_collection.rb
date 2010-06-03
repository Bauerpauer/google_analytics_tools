class GAQ
  
  class EventCollection
    
    include Enumerable
    
    class InvalidEventError < StandardError
      def initialize(non_event)
        super("GAQ::EventCollection#<< expects instances of GAQ::Event, you passed #{non_event}")
      end
    end
    
    def initialize
      @events = []
    end
    
    def <<(event)
      raise InvalidEventError.new(event) unless event.is_a?(GAQ::Event)

      @events << event
    end

    def each
      @events.each { |e| yield e }
    end
    
  end
  
end
