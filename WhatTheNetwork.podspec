#
# Be sure to run `pod lib lint WhatTheNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WhatTheNetwork'
  s.version          = '0.1.2'
  s.summary          = 'Network library'


  s.homepage         = 'https://github.com/sadeghgoo/WhatTheNetwork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sadeghgoo' => 'sadeghitunes2@gmail.com' }
  s.source           = { :git => 'https://github.com/sadeghgoo/WhatTheNetwork.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'WhatTheNetwork/Classes/**/*'
  

end
