#
# Be sure to run `pod lib lint JTFadingInfoView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JTFadingInfoView"
  s.version          = “1.0.0”
  s.summary          = "A UIButton-based view with fade in/out animation features.”
  s.homepage         = "https://github.com/JunichiT/JTFadingInfoView"
  s.screenshots     = "https://raw.githubusercontent.com/JunichiT/JTFadingInfoView/master/Docs/simple.gif"
  s.license          = 'MIT'
  s.author           = { "JunichiTsurukawa" => "j.tsurukawa@gmail.com" }
  s.source           = { :git => "https://github.com/JunichiT/JTFadingInfoView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/'
  s.resource_bundles = {
    'JTFadingInfoView' => ['Pod/Assets/*.png']
  }
end
