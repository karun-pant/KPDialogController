Pod::Spec.new do |s|
	s.name             = 'KPDialogController'
	s.version          = '1.2'
	s.summary          = 'Created to have a customisable protocol oriented AlertController support for view controllers.'

	s.homepage         = 'https://github.com/karun-pant/KPDialogController'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'karun-pant' => 'karunpant@gmail.com' }
	s.source           = { :git => 'https://github.com/karun-pant/KPDialogController.git', :tag => s.version }
	s.social_media_url = 'https://twitter.com/karunpant'
	s.platform     = :ios, '9.0'
  s.source_files = 'Pod/Modules/*'
  s.resource_bundles = {
    s.name => ['Pod/Resources/*']
  }
  s.swift_version = '4.0'
  s.frameworks = 'UIKit'
  # s.screenshots  = 'www.example.com/screenshots_1.gif', 'www.example.com/screenshots_2.gif'
end