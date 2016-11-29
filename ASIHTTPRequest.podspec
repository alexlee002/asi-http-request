Pod::Spec.new do |s|
  s.name         = "ASIHTTPRequest"
  s.version      = "1.8.2"
  s.summary      = "Easy to use CFNetwork wrapper for HTTP requests, Objective-C, Mac OS X and iPhone."
  s.description  = <<-DESC
    This version is fork from "https://github.com/pokeb/asi-http-request" and 
    merge with "https://github.com/OpenFibers/asi-http-request".

    ASIHTTPRequest is an easy to use wrapper around the CFNetwork API that
    makes some of the more tedious aspects of communicating with web servers
    easier. It is written in Objective-C and works in both Mac OS X and iPhone
    applications.

    It is suitable performing basic HTTP requests and interacting with
    REST-based services (GET / POST / PUT / DELETE). The included
    ASIFormDataRequest subclass makes it easy to submit POST data and files
    using multipart/form-data.

    Please note that ASIHTTPRequest is not recommended for newer projects 
    since it's not actively maintained anymore. 
    For more info visit: http://allseeing-i.com/%5Brequest_release%5D
                   DESC

  s.homepage     = "http://allseeing-i.com/ASIHTTPRequest"
  s.license      = "New BSD License"
  s.author       = { "Ben Copsey" => "ben@allseeing-i.com" }
 
  s.source       = { :git => "https://github.com/alexlee002/asi-http-request", :branch => "master" }
  s.requires_arc = false

  s.subspec 'Core' do |cs|
    cs.source_files = 'Classes/*.{h,m}'
    cs.ios.dependency 'Reachability'
    cs.ios.frameworks = 'MobileCoreServices', 'CFNetwork', 'CoreGraphics'

    cs.osx.exclude_files = '**/*ASIAuthenticationDialog*'
    cs.osx.frameworks = 'SystemConfiguration', 'CoreServices'

    cs.libraries = 'z.1'
  end

  s.subspec 'ASIWebPageRequest' do |sp|
    sp.source_files = 'Classes/ASIWebPageRequest/*.{h,m}'
    sp.libraries = 'xml2.2'
    sp.xcconfig = {'HEADER_SEARCH_PATHS' => "$(SDKROOT)/usr/include/libxml2"}
    sp.dependency 'ASIHTTPRequest/Core'
  end

  s.subspec 'CloudFiles' do |sp|
    sp.source_files = 'Classes/CloudFiles/*.{h,m}', 'Classes/S3/ASINSXMLParserCompat.h'
    sp.dependency 'ASIHTTPRequest/Core'
  end

  s.subspec 'S3' do |sp|
    sp.source_files = 'Classes/S3/*.{h,m}'
    sp.dependency 'ASIHTTPRequest/Core'
  end
end
