require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-pixelated-image"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-pixelated-image
                   DESC
  s.homepage     = "https://github.com/cristea2017/react-native-pixelated-image"
  # brief license entry:
  s.license      = "MIT"
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Your Name" => "victor.kristea@mail.ru" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/cristea2017/react-native-pixelated-image.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,c,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  # ...
  # s.dependency "..."
end

