platform :ios, '12.0'

target 'toyBox' do
  use_frameworks! :linkage => :static

  pod 'FBSDKLoginKit'
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  pod 'FirebaseUI'
  pod 'CombineCocoa'
  pod 'Kingfisher'
  pod 'Bagel'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end

end
