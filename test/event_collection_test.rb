require "pathname"
require Pathname(__FILE__).dirname + 'helper'

class EventCollectionTest < Test::Unit::TestCase

  def test_event_collection_raises_on_non_event_insertion    
    ec = GAQ::EventCollection.new
    assert_raise(GAQ::EventCollection::InvalidEventError) { ec << "This is invalid" }
  end
  
  def test_event_collection_is_enumerable_and_iterates_in_insertion_order
    ec = GAQ::EventCollection.new
    
    assert(ec.respond_to?(:each))

    ec << (event0 = GAQ::Event.new('sample', 'test'))
    ec << (event1 = GAQ::Event.new('sample2', 'test2'))
    ec << (event3 = GAQ::Event.new('sample3', 'test3'))

    items = ec.map { |e| e }
    
    assert_equal(event0, items[0])
    assert_equal(event1, items[1])
    assert_equal(event3, items[2])
  end
  
end