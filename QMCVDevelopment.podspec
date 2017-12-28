#
#  Be sure to run `pod spec lint QMChatViewController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "QMCVDevelopment"
  s.version      = "0.5.1"
  s.summary      = "An elegant ready-to-go chat view controller for iOS chat applications that use Quickblox communication backend."

  s.description  = <<-DESC
  * Ready-to-go chat view controller with a set of cells.
  * Automatic cell size calculation.
  * UI customisation for chat cells.
  * Flexibility in improving and extending functionality.
  * Easy to connect with Quickblox.
  * Optimised and performant.
  * Supports portrait and landscape orientations.
  * Auto Layout inside.
  DESC

  s.homepage     = "https://github.com/QuickBlox/QMChatViewController-ios"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.authors      = {"Andrey Ivanov" => "andrey.ivanov@quickblox.com", "Vitaliy Gorbachov" => "vitaliy.gorbachov@quickblox.com", "Vitaliy Gurkovsky" => "vitaliy.gurkovsky@injoit.com"}
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ZalakSA/QMChatViewController-ios.git", :tag => "#{s.version}" }
  s.source_files = "QMChatViewController/QMChatViewController.{h,m}"

  s.subspec 'QMChatLocationSnapshotter' do |ss|
    ss.source_files = 'QMChatViewController/QMChatLocationSnapshotter/*.{h,m}'
  end

  s.subspec 'Categories' do |ss|
	   ss.dependency 'QMCVDevelopment/QMChatLocationSnapshotter'
     ss.source_files = 'QMChatViewController/Categories/*.{h,m}'
  end

  s.subspec 'Utils' do |ss|
	   ss.dependency 'QMCVDevelopment/Categories'
     ss.source_files = 'QMChatViewController/Utils/**/*.{h,m}'
  end

  s.subspec 'ViewModels' do |ss|

    ss.dependency 'QMCVDevelopment/Categories'
    ss.source_files = 'QMChatViewController/ViewModels/**/*.{h,m}'
  end

  s.subspec 'Sections' do |ss|
	   ss.dependency 'QMCVDevelopment/QMChatDataSource'
     ss.source_files = 'QMChatViewController/QMChatSection/*.{h,m}'
  end

  s.subspec 'QMChatDataSource' do |ss|
    ss.source_files = 'QMChatViewController/QMChatDataSource/*.{h,m}'
  end

  s.subspec 'Protocols' do |ss|
    ss.source_files = 'QMChatViewController/Protocols/*.{h}'
  end

  s.subspec 'Views' do |ss|
  	 ss.dependency 'QMCVDevelopment/Categories'
  	 ss.dependency 'QMCVDevelopment/Protocols'
     ss.dependency 'QMCVDevelopment/Utils'
     ss.source_files = 'QMChatViewController/Views/**/*.{h,m}'
  end

  s.resource_bundles = { "QMChatViewController" => ["QMChatViewController/**/*.xib", "QMChatViewController/**/*.png"] }
  s.resources = "QMChatViewController/Icons/Media.xcassets"
  s.requires_arc = true
  s.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/../../Framework $(PODS_ROOT)/../External" }
  s.dependency "TTTAttributedLabel", "> 1.13"
  s.dependency "SDWebImage", "~> 4.0.0"
  s.dependency "FFCircularProgressView"

end
