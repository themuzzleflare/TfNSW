Pod::Spec.new do |s|
  s.name = 'TfNSW'
  s.version = '19.0.0'
  s.swift_version = '5.4'
  s.author = { 'Paul Tavitian' => 'paul@tavitian.cloud' }
  s.social_media_url = 'https://twitter.com/TheMuzzleFlare'
  s.license = 'MIT'
  s.homepage = 'https://github.com/themuzzleflare/TfNSW'
  s.source = { :git => 'https://github.com/themuzzleflare/TfNSW.git', :tag => s.version.to_s }
  s.summary = 'TfNSW Swift library'
  s.platform = :ios, '13.0'
  s.source_files = 'Sources/**/*.swift'
  s.dependency 'SwiftDate'
end