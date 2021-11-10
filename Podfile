# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

def app_pods
  pod 'Swinject'
  pod 'Bond'
  pod 'SDWebImage'
  pod 'RealmSwift', '~>10'
end

def test_pods
  # Pods for testing
  pod 'Swinject'
end

target 'pokemonPoc' do
  use_frameworks!
  app_pods
end

target 'pokemonPocTests' do
  use_frameworks!
  test_pods
end
