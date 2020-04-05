**Base Flutter Project with a good separation of concerns.**

 - Personal API
 - `BLOC` and `repository` pattern
 - Generic API `response` and `status` class
 - Handling exceptions/timeouts in a generic way
 - Serialization of a a model class
 - Usage of generic widgets for loading and error prompt
 - Usage of shared preferences to store a token
 - `Pubspec` already configured and ready to go (fonts, images, dependencies)
 - SVG compatibility already built in
 - Simplified models according to the best practices by google on documentation (https://flutter.dev/docs/development/data-and-backend/json)
      - Follow the syntax at the `Movie` class and at the end generate the code running (`flutter pub run build_runner build`) (1)
      - Run` flutter pub run build_runner watch` tou avoid having to build by hand.
      
      flutter packages pub run build_runner build --delete-conflicting-outputs

In order to run flutter commands you need to(1):

        sudo nano /etc/paths
        write this /Users/yourUserName/Development/flutter/bin
        Exit the terminal and open it again (Restart inteliJ / Android studio / terminal)


**Commands to run a specific emulator:**
  1) Go to project folder and run
         
         flutter run -d iPhone 6
         
**After opening the project for the first time or if Pubspec is updated do:**

   1) `flutter pub get`
   2) `sudo gem install cocoapods`
   3) `pod install`
   4) cd ios and then `pod install`
   5) `flutter pub run build_runner build`(When a new model is added)
