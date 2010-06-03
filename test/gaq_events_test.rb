require "pathname"
require Pathname(__FILE__).dirname + 'helper'

class GAQEventsTest < Test::Unit::TestCase
  
  def test_set_account_event
    event = GAQ::Events::SetAccount.new('ABC123')
    assert_equal('_setAccount', event.name)
    assert_equal(['ABC123'], event.params)
  end

  def test_set_domain_name_event
    event = GAQ::Events::SetDomainName.new('foo.com')
    assert_equal('_setDomainName', event.name)
    assert_equal(['foo.com'], event.params)
  end
  
  def test_track_pageview_event
    event = GAQ::Events::TrackPageview.new
    assert_equal('_trackPageview', event.name)
    assert_equal([], event.params)
  end
  
  def test_track_event_without_category_or_label
    event = GAQ::Events::TrackEvent.new('Search', 'Executed')
    assert_equal('_trackEvent', event.name)
    assert_equal(['Search', 'Executed'], event.params)
  end

  def test_track_event_with_label
    event = GAQ::Events::TrackEvent.new('Search', 'Executed', 'Son of Sam')
    assert_equal('_trackEvent', event.name)
    assert_equal(['Search', 'Executed', 'Son of Sam', nil], event.params)
  end

  def test_track_event_with_value
    event = GAQ::Events::TrackEvent.new('Search', 'Executed', nil, 1)
    assert_equal('_trackEvent', event.name)
    assert_equal(['Search', 'Executed', nil, 1], event.params)
  end

  def test_track_event_with_label_and_value
    event = GAQ::Events::TrackEvent.new('Search', 'Executed', 'Son of Sam', 1)
    assert_equal('_trackEvent', event.name)
    assert_equal(['Search', 'Executed', 'Son of Sam', 1], event.params)
  end

  def test_ecommerce_add_transaction_event
    event = GAQ::Events::ECommerce::AddTransaction.new(1, 'ACME', 123.45, 13.27, 75.35, 'Dallas', 'TX', 'USA')
    assert_equal('_addTrans', event.name)
    assert_equal(['1', 'ACME', '123.45', '13.27', '75.35', 'Dallas', 'TX', 'USA'], event.params)
  end

  def test_ecommerce_add_item_event
    event = GAQ::Events::ECommerce::AddItem.new(1, 123, 'Bacon', 'Chunky', 5.00, 42)
    assert_equal('_addItem', event.name)
    assert_equal(['1', '123', 'Bacon', 'Chunky', '5.0', '42'], event.params)
  end
  
  def test_ecommerce_track_trans_event
    event = GAQ::Events::ECommerce::TrackTransaction.new
    assert_equal('_trackTrans', event.name)
    assert_equal([], event.params)
  end

end