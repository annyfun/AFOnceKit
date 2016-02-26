Pod::Spec.new do |s|
  s.name          = 'AFOnceKit'
  s.version       = '1.0.0'
  s.summary       = 'AFOnceKit'
  s.homepage      = 'https://github.com/annyfun/AFOnceKit.git'
  s.author        = { 'AnnyFun' => 'appledev@qq.com' }
  s.platform      = :ios, '7.0'
  s.source        = {
      :git => 'https://github.com/annyfun/AFOnceKit.git',
      :tag => '1.0.0'
  }
  s.source_files = 'AFOnceKit/*.{h,m}'
  s.license = 'MIT'
  s.requires_arc = true
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'
end
