# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require

  require 'motion_model'
  require 'motion_model/sql'
  require 'motion_model/fmdb'
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Timereporter'

  app.info_plist['UIViewControllerBasedStatusBarAppearance'] = true
  app.interface_orientations = [:portrait]

  app.pods do
    pod 'NanoStore', '~> 2.6.0'
  end
end
