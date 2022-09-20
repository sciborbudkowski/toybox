platform :ios, '15.0'

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
      if target.name == 'Realm'
        create_symlink_phase = target.shell_script_build_phases.find { |x| x.name == 'Create Symlinks to Header Folders' }
        create_symlink_phase.always_out_of_date = "1"
      end
    end
  end

end
