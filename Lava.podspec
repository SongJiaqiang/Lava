#
# Be sure to run `pod lib lint Lava.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Lava'
  s.version          = '0.0.1'
  s.summary          = 'A simple SDK that provides music data.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    A simple SDK that provides music data.
    The data structure is as follows👇
    |-Radio (radio_id, radio_name, channels)
    |--Channel (channel_id, channel_name, pic_url, programs)
    |---Program (program_id, program_name, pic_url, songs)
    |----Song (song_id, song_name, artist_name, album_name, pic_url)
                       DESC

  s.homepage = 'https://github.com/songjiaqiang/Lava'
  s.screenshots = 'https://raw.githubusercontent.com/SongJiaqiang/EvoRadio/master/screenshots/v0.2/01-Now.png', 'https://raw.githubusercontent.com/SongJiaqiang/EvoRadio/master/screenshots/v0.2/02-Programs.png', 'https://raw.githubusercontent.com/SongJiaqiang/EvoRadio/master/screenshots/v0.2/03-Songs.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sjq2150@gmail.com' => 'sjq2150@gmail.com' }
  s.source           = { :git => 'https://github.com/songjiaqiang/Lava.git', :tag => s.version.to_s }
  s.social_media_url = 'https://songjiaqiang.github.io'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

  s.swift_versions = ['5.0', '5.1']

  s.source_files = 'Lava/Classes/**/*'
  
  s.dependency 'Alamofire', '~> 4.8.0'
  s.dependency 'ObjectMapper', '~> 3.4.0'
   
end
