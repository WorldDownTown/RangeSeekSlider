Pod::Spec.new do |s|
  s.name                  = 'RangeSeekSlider'
  s.version               = '1.7.0'
  s.summary               = 'RangeSeekSlider provides a customizable range slider like a UISlider.'
  s.description           = <<-DESC
                            RangeSeekSlider provides a customizable range slider like a UISlider.
                            This library based on [TomThorpe/RangeSeekSlider](https://github.com/TomThorpe/RangeSeekSlider) (Objective-C) and made with Swift.
                            DESC
  s.homepage              = 'https://github.com/WorldDownTown/RangeSeekSlider'
  s.screenshots           = 'http://i.giphy.com/xUA7b21tlFYPzwFvTq.gif'
  s.license               = { type: 'MIT', file: 'LICENSE' }
  s.author                = { WorldDownTown: 'WorldDownTown@gmail.com' }
  s.source                = { git: 'https://github.com/WorldDownTown/RangeSeekSlider.git', tag: s.version.to_s }
  s.social_media_url      = 'https://twitter.com/WorldDownTown'
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.1'
  s.source_files          = 'Sources/*.swift'
  s.frameworks            = ['CoreGraphics', 'UIKit']
end
