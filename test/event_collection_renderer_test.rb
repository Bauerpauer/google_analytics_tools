require "pathname"
require Pathname(__FILE__).dirname + 'helper'

class EventCollectionRendererTest < Test::Unit::TestCase

  def test_event_collection_renderer_yield_proper_javascript_snippit_for_default_tracker
    event_collection = GAQ::EventCollection.new
    event_collection << GAQ::Event.new('event1', 1)
    event_collection << GAQ::Event.new('event2', 2)
    event_collection << GAQ::Event.new('event3', 3)

    ecr = GAQ::EventCollectionRenderer.new(event_collection, nil)
    assert_equal("_gaq.push([\"event1\",1]);\n_gaq.push([\"event2\",2]);\n_gaq.push([\"event3\",3]);", ecr.to_s)
  end

  def test_event_collection_renderer_yield_proper_javascript_snippit_for_custom_tracker
    event_collection = GAQ::EventCollection.new
    event_collection << GAQ::Event.new('event1', 1)
    event_collection << GAQ::Event.new('event2', 2)
    event_collection << GAQ::Event.new('event3', 3)

    ecr = GAQ::EventCollectionRenderer.new(event_collection, 't2')
    assert_equal("_gaq.push([\"t2.event1\",1]);\n_gaq.push([\"t2.event2\",2]);\n_gaq.push([\"t2.event3\",3]);", ecr.to_s)
  end

end