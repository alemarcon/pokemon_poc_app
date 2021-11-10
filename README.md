# Pokemon App

This is a simple app that displays information about Pokemon via the "pokeapi.co" API.

## Modules
- **Data** - Contains classes to get data from API and database
- **Domain** - Business logic
- **Presentation** - Presentation layer
- **Application** - Containt file config and dependency injection configurations
- **Infrastructure** - Boilerplate code for network call

## Dependency manager
I chose to use Cocoapods as a dependency manager because compared to Carthage it is easier and more immediate to add dependencies. Furthermore, being based on a centralized system, it guarantees the ease of checking outdated versions. It also has a search engine that facilitates the search for external frameworks. Having never used Swift Package Manager, I cannot give a personal opinion on this system.

## External frameworks
- [Swinject] - Swinject is a lightweight dependency injection framework for Swift.
- [Bond] - Bond is a Swift binding framework
- [Realm] - Realm mobile open source database
- [SDWebImage] - Async image downloader

## Extra
This application is developed on Xcode version 12.5.1 (12E507). Cocoapods version 1.10.1 is used as dependecy manager. Pods folder is not committed, so before starting the app you need to install all the dependencies with

```ruby
pod install
```

command.



[Swinject]: <https://github.com/Swinject/Swinject>
[Bond]: <https://github.com/DeclarativeHub/Bond>
[Realm]: <https://realm.io/>
[SDWebImage]: <https://github.com/SDWebImage/SDWebImage>