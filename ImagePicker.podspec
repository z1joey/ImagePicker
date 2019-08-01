Pod::Spec.new do |spec|
  spec.name          = "ZYImagePicker"
  spec.version       = "1.0.0"
  spec.summary       = "ImagePicker"
  spec.swift_version = '5.0'
  spec.description   = "Select a image from photo library by using singleton"
  spec.homepage      = "https://github.com/z1joey/ImagePicker"
  spec.license       = "MIT"
  spec.author        = { "Joey Zhang" => "z1joey@iCloud.com" }
  spec.platform      = :ios, "9.0"
  spec.source        = { :git => "https://github.com/z1joey/ImagePicker.git", :tag => spec.version }
  spec.source_files  = "ImagePicker/*.swift"
  spec.exclude_files = "ImagePickerSample"
end