module GoogleAnalyticsTools

  class AsyncTrackingQueue

    def initialize
      @events = []
    end
    
    def <<(event)
      push(event)
    end

    def push(event, tracker_id = nil)
      @events << renderer_for_event(event, tracker_id)
    end

    def to_s
<<-JAVASCRIPT
<script type="text/javascript">
var _gaq = _gaq || [];
#{@events.map { |event| event.to_s }.join("\n")}
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
JAVASCRIPT
    end
    
    private
    
    def renderer_for_event(event, tracker_id)
      case event
      when Event then EventRenderer.new(event, tracker_id)
      when EventCollection then EventCollectionRenderer.new(event, tracker_id)
      end
    end

  end
end

GAT = GoogleAnalyticsTools
GAQ = GAT::AsyncTrackingQueue