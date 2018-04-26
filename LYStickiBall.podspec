Pod::Spec.new do |s|


  s.name         = "LYStickiBall"
  s.version      = "1.0.1"
  s.summary      = "A simple UIView category which can easy integrated QQ sticky red dots view."

  s.description  = "A category for UIView which can easy integrated QQ sticky red dots view. //> 一行代码集成 QQ 粘性未读数红点视图"

  s.homepage     = "https://github.com/install-b/LYStickiBall"

  s.license      = "MIT"


  s.author             = { "instal-b" => "645256685@qq.com" }

  s.platform     = :ios, "8.0"



  s.source       = { :git => "https://github.com/install-b/LYStickiBall.git", :tag => s.version }

  s.source_files  = "Classes/**/*.{h,m}"


  s.public_header_files = "Classes/*.h"

  s.resource  = "Classes/Explosion.bundle"


  s.framework  = "UIKit"


  s.requires_arc = true

  s.dependency 'pop', '~> 1.0.10'

end
