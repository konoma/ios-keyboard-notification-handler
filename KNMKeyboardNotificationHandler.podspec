
Pod::Spec.new do |s|

  s.name         = "KNMKeyboardNotificationHandler"
  s.version      = "0.1.0"
  s.homepage     = "https://github.com/konoma/ios-keyboard-notification-handler"
  s.summary      = "A simple wrapper around UIKeyboard notifications."
  s.description  = """
  Observe keyboard changes using handler blocks which get helper objects that prepare information
  taken from the notification info.
  """

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Markus Gasser" => "markus.gasser@konoma.ch" }

  s.source       = { :git => "https://github.com/konoma/ios-keyboard-notification-handler.git", :tag => '0.1.0' }

  s.platform = :ios, '7.0'
  
  s.source_files        = 'Sources/*.{h,m}'
  s.public_header_files = 'Sources/*.h'
  s.requires_arc        = true
  s.frameworks          = 'Foundation', 'UIKit'
  
end
