#
# Be sure to run `pod lib lint XWLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XWLib'
  s.version          = '0.1.14'
  s.summary          = '试试更新了'
  s.swift_version    = '5.0'

  s.homepage         = 'https://github.com/my59/XWLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'my59' => '595599987@qq.com' }
  s.source           = { :git => 'https://github.com/my59/XWLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.source_files = 'XWLib/*.swift'
  
  s.frameworks = 'UIKit'

  #s.vendored_libraries = "XWLib/Classes/**/*.a"
  
  # s.resource_bundles = {
  #   'XWLib' => ['XWLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
