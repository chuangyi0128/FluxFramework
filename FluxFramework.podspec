Pod::Spec.new do |s|
  s.name             = "FluxFramework"
  s.version          = "0.1.0"
  s.summary          = "Flux Framework & Simple Demo"
  s.description      = "Including FluxAction, FluxStore, FluxDispatcher"
  s.homepage         = "https://github.com/chuangyi0128/FluxFramework"
  s.license          = 'MIT'
  s.author           = { "SongLi" => "chuangyi0128@gmail.com" }
  s.source           = { :git => "https://github.com/chuangyi0128/FluxFramework.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = "6.0"
  s.requires_arc = true

  s.public_header_files = 'FluxFramework.framework/Headers/*.h'
  s.vendored_frameworks  = 'FluxFramework.framework'
end
