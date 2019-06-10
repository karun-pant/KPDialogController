Pod::Spec.new do |s|
  s.name         = 'KPDialogController'
  s.version      = '1.1.5'
  s.summary      = 'Created to have a customisable protocol oriented AlertController support for view controllers.'
  s.description  = <<-DESC
            Created to have a customisable protocol oriented AlertController support for view controllers. iOS custom dialog developed in swift considering protocol oriented programming.
                   DESC
  s.homepage     = 'https://github.com/karun-pant/KPDialogController'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.social_media_url = 'https://twitter.com/karunpant'
  s.authors       = { 'karun-pant' => 'karunpant@gmail.com' }
  s.source       = { :git => 'https://github.com/karun-pant/KPDialogController.git', :tag => s.version }
  s.source_files  = 'KPDialogController/KPDialogController.h', 'KPDialogController/Module/*.{swift}'
  s.exclude_files = 'Examples/*'
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'
  s.resource_bundles = {
    s.name => ['KPDialogController/Resources/*']
  }
  # s.screenshots  = 'www.example.com/screenshots_1.gif', 'www.example.com/screenshots_2.gif'
end