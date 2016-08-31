#
# Be sure to run `pod lib lint RecurrenceRuleUI-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RecurrenceRuleUI-iOS'
  s.version          = '0.1.0'
  s.summary          = 'UI Component for RecurrenceRule-iOS.'

  s.description      = <<-DESC
  The UI Implementation of the Picker for RecurrenceRule.
  Similar to the iOS Calendar Recurrence Picker
  Useful for setting up reminders
                       DESC

  s.homepage         = 'https://github.com/practo/RecurrenceRuleUI-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sambhav Shah' => 'sambhav.shah@practo.com' }
  s.source           = { :git => 'https://github.com/practo/RecurrenceRuleUI-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'RecurrenceRuleUI-iOS/Classes/**/*.{swift,m}'
  
  s.resource_bundles = {
	'RecurrenceRuleUI-iOS' => ['RecurrenceRuleUI-iOS/Assets/**/*.{png,xcassets,xib,strings}']
  }
  s.dependency 'RecurrenceRule-iOS'
end
