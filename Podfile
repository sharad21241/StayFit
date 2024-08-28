# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'
use_frameworks!
target 'StayFit' do
  # Comment the next line if you don't want to use dynamic frameworks
  

  # Pods for StayFit
	pod 'Alamofire'
  pod 'iCarousel'
  pod 'Firebase'
  pod 'Firebase/Analytics'
  pod 'Firebase/Database'
  pod 'Firebase/Firestore'
  pod 'Firebase/Auth'
  pod 'IQKeyboardManagerSwift'
  pod 'CarbonKit'
  
  post_install do |installer|
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
      end
    end
    
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        if config.base_configuration_reference.is_a? Xcodeproj::Project::Object::PBXFileReference
          xcconfig_path = config.base_configuration_reference.real_path
          IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
        end
      end
    end
  end
end
