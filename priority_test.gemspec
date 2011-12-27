# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)
require 'priority_test'

Gem::Specification.new do |s|
  s.name        = "priority_test"
  s.version     = PriorityTest::VERSION
  s.authors     = ["Owen Ou"]
  s.email       = ["jingweno@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Run tests in priority}
  s.description = %q{Run tests in priority}

  s.rubyforge_project = "priority_test"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "rspec"
end
