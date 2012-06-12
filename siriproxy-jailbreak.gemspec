# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "siriproxy-jailbreak"
  s.version     = "0.0.1" 
  s.authors     = ["Ndrey"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{Siri check jailbreak status}
  s.description = %q{Ask Siri if there any jailbreak solution for your device}

  s.rubyforge_project = "siriproxy-jailbreak"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "httparty"
end

