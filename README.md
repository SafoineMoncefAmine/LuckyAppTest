# LuckyAppTest

## Pre-Requisites
This Assesement has been developed with Swift 5.1, Xcode 12.2 and CocoaPods  1.12.2. So you must have Xcode install on your computer and be sure you have the last version of Cocoa pod install on your computer. To check if pod is available, lauch the following command :
```
pod --version
```
## Installation

1. Go to the root of the project on your computer:
```
cd ~/LuckyAppTest
```
2. Normally, pod dependencies are not ignored by `.gitignore`, as it's recommended on iOS/Swift project (https://github.com/github/gitignore/blob/master/Swift.gitignore). But to be sure all you config files are up to date, launch the folowing command:
```
pod install
```
3. At this step, everything is ready to begin the development phase, open the project on Xcode:
```
open luckyApp.xcworkspace
```
4. At last, build the project from Xcode:
```
cmd + b
```

## Architecture
Here will be explain all about folders, their content and the way they are implented and called each other. This architecture is based on MVVM architecture but we're not using data-binding between ViewModel and ViewController

### Constants
Constants folder contains 4 enum files, that simplify managements and creation of components like Color, Font, Text and Image. Instead of make direct reference to an image with `UIImage(named:)`, you could instantiate an image by `AppImage.IMAGE_ASSETS_XCASSETS_NAME.value()`, avoding reference to old image that don't exist anymore, and have compilation error if the `IMAGE_ASSETS_XCASSETS_NAME` is not reference in the Image enum.

Same goes for *Texts*, *Fonts* and *Colors* 

### Managers
They are classes with only static methods, so they can not keep states (unlike services). Each manager reprensents a set of methods that rely on the same topics, for now we have only one Manager that handles Logs in the App.

### Services
Services represent one time instantiation class that are sharing by all ViewModels components. They can keep states and sharing them.

**Important:** Services must never have reference to a ViewModel component. They should "ignore there existance" (in order to avoid double strong reference and a messy app where every component make reference to others).

### Model
Model are entities obtain via web service, configuration or other external way, and distribute in the app. Most model object are conform to the `Codable/Decodable/Encodable` protocol, to realize mapping from `JSON` data to the entity itself. Both classes and structs are present.

### ViewModels
A ViewModel role is to interact with a View, thanks to Model and Services.  More specifically a ViewModel can : obtains Model via Web Service, transform them, and distribute them to View components.

**Important:** We don't have data-binding between Views and ViewModels

**Important:** All data exchange between ViewModels and Views are basic types (String, Int, Bool, etc.) or data stuct.

**Important:** All strings and images should be implement here and not in View layer, even if it's static ones. For Font and Color, the best solution stay to manage them in ViewModel layer.

### Views
This folder contains all View layer components, mostly UIViewController and UIView. In the Commom folder, there are all UIViews and UIViewControllers classes that are sharing by different others View component. They are mostly `UIKit` components.

**Important:** We decided to not using segue all over the app. So each `storyboard` file represents a unique `UIViewController`, that is compliant with `StoryboardBased` protocol to instantiate it easilier. Moreover the "Is Initial View Controller" option should be activate for the storyboard.

### Extensions
As it's name suggests, this folder contains only Extension for iOS SDK or pod files classes and structures, and where scope of the extension is global. When the scope of an extension concern only one file (like player for instance) extension is directly declared in the file

### Ressources
This folder contains all files and document that are not common iOS/swift files (these common files ended with `.swift`). It's here that we have the `Localizable.strings` or `Assets.xcassets` files for exemple. All the `.plist` adn `.ttf`   will be there too.


### Unit testing

## Comments
Comments are present all over the project to explain some piece of code, to do work or improvement that could come later. Some comments are prefixed with a specific syntax for a specific meanning :

- `// TODO` : Means a task, a piece of logic or some treatments linked to a feature is missing and should be implemented.
- `// NOTE` : Some remarks about logic implemented and how it works
