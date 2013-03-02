# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

require 'bundler'
Bundler.require
#require 'motion-cocoapods'

# $: << File.expand_path('../../lib', __FILE__)
# require 'motion_model'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'TimereporterMotion'

  app.pods do
    pod 'FMDB', :git => 'https://github.com/Dan2552/fmdb.git'
  #   pod 'iActiveRecord', :git => 'https://github.com/Dan2552/iActiveRecord.git'
  end
end
