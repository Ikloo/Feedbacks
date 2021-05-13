Pod::Spec.new do |spec|
  spec.name         = "Feedbacks"
  spec.version      = "0.2.0"
  spec.summary      = "Feedbacks is an easy way to show UI/UX feedback."
  spec.description      = <<-DESC
Feedbacks is an easy way to show UI/UX feedback.
                       DESC
  spec.homepage     = "https://github.com/Ikloo/Feedbacks.git"
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "Kirill Budevich" => "ikloo@yandex.ru" }
  spec.platform     = :ios
  spec.platform     = :ios, "10.0"
  spec.ios.deployment_target = "10.0"
  spec.swift_version = "5.2"

  spec.source       = { :git => "https://github.com/ikloo/Feedbacks.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/Feedbacks/**/*.{h,m,swift}"
end
