# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{google_analytics_tools}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Bauer"]
  s.date = %q{2011-07-05}
  s.description = %q{A clean interface to generating the Google Analytics _gaq}
  s.files = ["Rakefile", "lib/google_analytics_tools", "lib/google_analytics_tools/version.rb", "lib/google_analytics_tools/tracking", "lib/google_analytics_tools/tracking/async_tracking_queue.rb", "lib/google_analytics_tools/tracking/events", "lib/google_analytics_tools/tracking/events/event_collection_renderer.rb", "lib/google_analytics_tools/tracking/events/event.rb", "lib/google_analytics_tools/tracking/events/event_collection.rb", "lib/google_analytics_tools/tracking/events/events.rb", "lib/google_analytics_tools/tracking/events/event_renderer.rb", "lib/google_analytics_tools.rb"]
  s.homepage = %q{http://rdoc.info/projects/Bauerpauer/google_analytics_tools}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A clean interface to generating the Google Analytics _gaq}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
  end
end
