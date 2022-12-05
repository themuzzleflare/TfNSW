Pod::Spec.new do |spec|
  spec.name = 'TfNSW'
  spec.version = '51.8.0'
  spec.author = { 'Paul Tavitian' => 'paul@tavitian.cloud' }
  spec.social_media_url = 'https://twitter.com/PTavitian1'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage = 'https://github.com/themuzzleflare/TfNSW'
  spec.source = { :git => 'https://github.com/themuzzleflare/TfNSW.git', :tag => spec.version.to_s }
  spec.summary = 'TfNSW Swift library'
  spec.platform = :ios, '16.0'
  spec.dependency 'SwiftDate'
  spec.frameworks = 'Foundation', 'UIKit', 'CoreLocation'
  spec.source_files = 'Sources/**/*.swift'
end
