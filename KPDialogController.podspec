Pod::Spec.new do |s|
	s.name             = 'KPDialogController'
	s.version          = '1.3.2'
	s.summary          = 'Created to have a customisable protocol oriented AlertController support for view controllers.'

	s.homepage         = 'https://github.com/karun-pant/KPDialogController'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'karun-pant' => 'karunpant@gmail.com' }
	s.source           = { :git => 'https://github.com/karun-pant/KPDialogController.git', :tag => s.version }
	s.social_media_url = 'https://twitter.com/karunpant'
	s.platform     = :ios, '9.0'
	s.source_files = 'Pod/Modules/*.swift'
	s.resource_bundle = { 'KPDialogController' => 'Pod/Resources/**/*.storyboard' }
	s.resource = 'Pod/Resources/**/*.storyboard'
	
  s.swift_version = '5.0'
	s.frameworks = 'UIKit'
	s.screenshot = 'https://raw.githubusercontent.com/karun-pant/KPDialogController/master/Example/Screenshots/alert.png'
end
