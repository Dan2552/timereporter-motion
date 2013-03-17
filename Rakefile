# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'TimereporterMotion'
  app.provisioning_profile = "/Users/dan2552/Library/MobileDevice/Provisioning\ Profiles/0A6532DC-0B2C-44B9-8A61-86CF5A12349F.mobileprovision"
  app.codesign_certificate = "iPhone Developer: Daniel Green (HS2522T72D)"
  app.pods do
    pod 'FMDB', :git => 'https://github.com/Dan2552/fmdb.git'
    pod 'NUI'
  end
end
