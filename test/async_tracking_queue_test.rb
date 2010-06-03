require "pathname"
require Pathname(__FILE__).dirname + 'helper'

class AsyncTrackingQueueTest < Test::Unit::TestCase

  VALID_SNIPPIT = <<-JAVASCRIPT
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push([\"event1\",1]);
_gaq.push([\"event2\",2]);
_gaq.push([\"t2.event1\",1]);
_gaq.push([\"t2.event2\",2]);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
  JAVASCRIPT

  def test_queue_renders_valid_javascript_snippit
    gaq = GAQ.new
    
    # Add 2 events to the default tracker
    gaq << GAQ::Event.new('event1', 1)
    gaq << GAQ::Event.new('event2', 2)

    # Add 2 events for an alternate tracker
    gaq.push(GAQ::Event.new('event1', 1), 't2')
    gaq.push(GAQ::Event.new('event2', 2), 't2')

    assert_equal(VALID_SNIPPIT, gaq.to_s)
  end

end