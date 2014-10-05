Pod::Spec.new do |s|
	s.name					= 'JSQMessagesViewController'
	s.version				= '5.3.2'
	s.summary				= 'An elegant messages UI library for iOS.'
	s.homepage				= 'https://github.com/Azat92/JSQMessagesViewController'
	s.license				= 'MIT'
	s.screenshots			= ['https://raw.githubusercontent.com/jessesquires/JSQMessagesViewController/develop/Screenshots/screenshot0.png',
								'https://raw.githubusercontent.com/jessesquires/JSQMessagesViewController/develop/Screenshots/screenshot1.png']
	s.author				= { 'Azat Almeev' => 'azat.almeev@gmail.com' }
	s.social_media_url		= 'https://twitter.com/AzatAlmeev'
	s.source				= { :git => 'https://github.com/Azat92/JSQMessagesViewController.git', :tag => s.version.to_s }
	s.platform				= :ios, '7.0'	
	s.source_files			= 'JSQMessagesViewController/**/*.{h,m}'
	s.resources				= 'JSQMessagesViewController/Assets/**/*.{png,aiff}', 'JSQMessagesViewController/**/*.{xib}'
	s.frameworks			= 'QuartzCore', 'CoreGraphics'
	s.requires_arc			= true

	s.dependency 'JSQSystemSoundPlayer'
	s.dependency 'SDWebImage'
	s.dependency 'BlocksKit'
end
