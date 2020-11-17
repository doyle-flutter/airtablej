#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint airtablej.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'airtablej'
  s.version          = '1.0.4'
  s.summary          = 'Flutter Airtable HTTP(s) Connect'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/doyle-flutter/airtablej'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'doyle4479@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
