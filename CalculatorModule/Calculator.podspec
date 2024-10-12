Pod::Spec.new do |spec|
    spec.name         = "Calculator"
    spec.version      = "1.0.0"
    spec.summary      = "A pod that wraps a C++ Calculator module"
    spec.description  = "This pod provides a wrapper around a C++ library for use in iOS projects."
    spec.homepage     = "http://example.com/MyPod"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author       = { "Your Name" => "your_email@example.com" }
    spec.source       = { :git => "http://example.com/MyPod.git", :tag => "#{spec.version}" }
  
    spec.ios.deployment_target = "12.0"
    spec.source_files = 'ObjCWrapper/*.{h,mm}', 'Calculator.h', 'Calculator.cpp'
  
    spec.pod_target_xcconfig = {
      'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
      'CLANG_CXX_LIBRARY' => 'libc++'
    }
  end