MRuby::Gem::Specification.new('kaminari') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'kaminari'
  spec.bins    = ['kaminari']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
  spec.add_dependency 'mruby-getopts', :mgem => 'mruby-getopts'
  spec.add_dependency 'mruby-at_exit', :mgem => 'mruby-at_exit'
  spec.add_dependency 'mruby-ansi-colors', :mgem => 'mruby-ansi-colors'
end
