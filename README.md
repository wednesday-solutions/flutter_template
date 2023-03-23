

<img align="left" src="flutter_template_github.svg" width="480" height="440" />

<div>
  <a href="https://www.wednesday.is?utm_source=gthb&utm_medium=repo&utm_campaign=serverless" align="left"><img src="https://uploads-ssl.webflow.com/5ee36ce1473112550f1e1739/5f5879492fafecdb3e5b0e75_wednesday_logo.svg"></a>
  <p>
    <h1 align="left">Flutter Template</h1>
  </p>
  <p>
  A Flutter template application showcasing - Clean architecture, Responsive design, State management, Decoupled widgets using the connector pattern, Dependency Injection, Widget and Unit testing, Navigation, Localization, Material 3 dynamic theming, Continuous Integration and Continuous Deployment.
  </p>

  ___


  <p>
    <h4>
      Expert teams of digital product strategists, developers, and designers.
    </h4>
  </p>

  <div>
    <a href="https://www.wednesday.is/contact-us?utm_source=gthb&utm_medium=repo&utm_campaign=serverless" target="_blank">
      <img src="https://uploads-ssl.webflow.com/5ee36ce1473112550f1e1739/5f6ae88b9005f9ed382fb2a5_button_get_in_touch.svg" width="121" height="34">
    </a>
    <a href="https://github.com/wednesday-solutions/" target="_blank">
      <img src="https://uploads-ssl.webflow.com/5ee36ce1473112550f1e1739/5f6ae88bb1958c3253756c39_button_follow_on_github.svg" width="168" height="34">
    </a>
  </div>

  ___

<span>We’re always looking for people who value their work, so come and join us. <a href="https://www.wednesday.is/hiring">We are hiring!</a></span>
</div>

![CI](https://github.com/wednesday-solutions/flutter_template/actions/workflows/ci.yml/badge.svg)
 
## Getting Started
Clone the repo and follow these steps to setup the project.

#### Environment
The template was build using dart null safety. Dart 2.19.2 or greater and Flutter 3 or greater is required. 

[Follow this guide to setup your flutter environment](https://docs.flutter.dev/get-started/install) based on your platform.

#### Flutter
First and foremost make sure you have Flutter 3 setup on your system. 
You can check the version by running
```bash
flutter --version
```
You should see output similar to this. Check if the version is `3.x.x`.
```bash
Flutter 3.7.7 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 2ad6cd72c0 (13 days ago) • 2023-03-08 09:41:59 -0800
Engine • revision 1837b5be5f
Tools • Dart 2.19.4 • DevTools 2.20.1
```
If not run this command to update flutter to the latest version
```bash
flutter upgrade
```

#### Derry
This template uses [`derry`](https://pub.dev/packages/derry) as it's script manager.
Run this command to setup derry
```bash
dart pub global activate derry
```
Most of the scripts we will use are abstracted away by derry. If you want to know more about the scirpts, read the [scripts documentation](scripts/README.md).
#### Get Dependencies
```shell
flutter pub get
```
#### Run Code Generation
```shell
derry generate all
```

#### API Key

> #####  You can skip this step if you just want to get the template running. If you skip this step, the weather search will not give you any results.

Sensitive information like api keys, credentials, etc should not be checked into git repos, especially public ones. To keep such data safe the template uses `.env` files. Each [Flavor](#flavors) uses it's own `.env` file.

The tempalte uses weather api from `openweathermap.org`. 
You can get your Open Weather API key from [here](https://openweathermap.org/appid#start).

Once you have the key, update the `.env` files with your api key. Replace `YOUR_API_KEY` with the key that you got from open weather api.
```
OPEN_WEATHER_API_KEY=YOUR_API_KEY  
OPEN_WEATHER_BASE_URL=https://api.openweathermap.org/
```

## Running the app
With the setup done, we can get the app running.

#### Flavors
The template comes with built-in support for 3 flavors. Each flavor has it's own `.env` file.
- dev - [`.env.dev`](.env.dev)
- qa - [`.env.qa`](.env.qa)
- prod - [`.env`](.env)

You can setup any environment specific values in the respective `.env` files.

#### Launch 
To launch the app run the following command and specify the flavor name.
```shell
 derry launch dev
```
#### Android Studio
On android studio, you will find pre defined run configurations.
- Select a flavor from the dropdown
<img width="596" alt="Screenshot 2023-03-21 at 11 24 35 AM" src="https://user-images.githubusercontent.com/58199625/226533162-0f12665f-ee39-4b85-b35c-06f7b8d55d88.png">

- Select a device to launch on
<img width="413" alt="Screenshot 2023-03-21 at 11 24 25 AM" src="https://user-images.githubusercontent.com/58199625/226533186-9d61675a-7871-4a1e-a2b3-3dac3d8f16cc.png">

- Click `Run` to launch the app

<img width="423" alt="Screenshot 2023-03-21 at 11 24 45 AM" src="https://user-images.githubusercontent.com/58199625/226533216-0cc430f1-08f5-4c94-95ef-70a853aa2da4.png">

## Architecture
The architecture of the template facilitates separation of concerns and avoids tight coupling between it's various layers. The goal is to have the ability to make changes to individual layers without affecting the entire app. This architecture is an adaptation of concepts from [`The Clean Architecture`](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

### Layers
The architecture is separated into the following layers
- [`lib/presentation`](lib/presentation): All UI and state management elements like widgets, pages and view models.
- [`lib/navigation`](lib/navigation): navigators to navigate between destinations.
- [`lib/interactor`](lib/interactor): provides feature specific functionality.
- [`lib/domain`](lib/domain): use cases for individual pieces of work.
- [`lib/repository`](lib/repository): repositories to manage various data sources.
- [`lib/services`](lib/services): services provide access to external elements such as databases, apis, etc.

Each layer has a `di` directory to manage Dependency Injection for that layer.

### Entities
The layers `presentation`, `domain` and `services` each have an `entity` directory.
- [`lib/presentation/entity`](lib/presentation/entity): Classes that model the visual elements used by the widgets.
- [`lib/domain/entity`](lib/domain/entity): Model classes for performing business logic manipulations. They act as an abstraction to hide the local and remote data models.
- [`lib/services/entity`](lib/services/entity): Contains local models (data classes for the database) and remote models (data classes for the api).

#### Entity Naming Convention
- Presentation entities are prefixed with `UI` (eg: UICity).
- Domain entities do not have any prefix. (eg: City).
- Service entities are of 2 types:
  - Local / Database entities are prefixed with `Local` (eg: LocalCity).
  - Remote / API entities are prefixed with `Remote` (eg: RemoteCity).

### Other Directories
Apart from the main layers, the template has
- [`lib/foundation`](lib/foundation): Extensions on primitive data types, loggers, global type alias etc.
- [`lib/flavors`](lib/flavors): Flavor i.e. Environment related classes.
- [`lib/app.dart`](lib/app.dart): App initialization code.

## Understanding the Presentation Layer
The presentation layer houses all the visual components and state management logic.

The [`base`](lib/presentation/base) directory has all the reusable and common elements used as building blocks for the UI like common widgets, app theme data, exceptions, base view models etc.

### View Model
State Management is done using the [`riverpod`](https://riverpod.dev/) along with [`state_notifier`](https://pub.dev/packages/state_notifier). The class that manages state is called the `View Model`. 

Each `View Model` is a subclass of the `BaseViewModel`. The [`BaseViewModel`](lib/presentation/base/view_model_provider/base_view_model.dart) is a `StateNotifier` of [`ScreenState`](#screen-state). Along with the ScreenState it also exposes a stream of [`Effect`](#effect). 

Implementations of the BaseViewModel can also choose to handle [`Intents`](#intent).

### Screen State
[`ScreenState`](lib/presentation/entity/screen/screen_state.dart) encapsulates all the state required by a [`Page`](#page). State is any data that represents the current situation of a Page.

For example, the [`HomeScreenState`](lib/presentation/destinations/weather/home/home_screen_state.dart) holds the state required by the [`HomePage`](lib/presentation/destinations/weather/home/home_page.dart).

### Effect
[`Effects`](lib/presentation/entity/effect/effect.dart) are events that take place on a page that are not part of the state of the screen. These usually deal with UI elements that are not part of the widget tree.

Showing a snackbar or hiding the keyboard are examples of an effect.


### Intent
Intent is any action that takes place on a page. It may or may not be user initiated. 

[`SearchScreenIntent`](lib/presentation/destinations/weather/search/search_screen_intent.dart) has the actions that can happen on the [`SearchPage`](lib/presentation/destinations/weather/search/search_page.dart).

### Page
A page is a widget that the navigator can navigate to. It should return the [`BasePage`](lib/presentation/base/page/base_page.dart) widget. 

The `BasePage` creates the structure for the page, initialises the [`ViewModel`](#view-model) and provides the view model in the widget tree so that all the children have access to it. It also listens to the effects from the view model and notifies the page about it.

Each page accepts the [`Screen`](#screen) object as input.

### Widgets
Each destination has a `widgets` directory. It holds all the widgets that appear on a [`Page`](#page) excluding the page itself. 

Each widget the requires access to data from the view model it split into two dart files. The `connector widget` communicates with the view model, and the `content widget` has the actual UI. The connector widget passes all the required data to the content widget. Thus the content widget never depends on the state managent solution used. This helps in easy replacement of state management solution if needed and also makes it easier to test widgets.

### Screen
A [`Screen`](lib/presentation/entity/screen/screen.dart) is a class that represents a `Page` in the context of navigation. It holds the `path` used by the navigator to navigate to a `Page` and also holds any arguments required to navigate to that `Page`.

## Templating
As you can read from the [Architecture](#architecture) section, adding a new page in the app can require a lot of files to be created. The template uses [`mason`](https://pub.dev/packages/mason_cli) as it's templating engine to automate some of this work.

To get started with mason, first activate mason globally
```bash
dart pub global activate mason_cli
```

Similar to using `pub get` we need to run `mason get` to setup the `bricks` (templates are called brick in mason).
```bash
mason get
```
You can learn more about `mason` [here](https://docs.brickhub.dev/).

#### Destination Brick
The template comes with a pre setup brick called `destination`.
Run the `destination` brick using the following command.
```bash
mason make destination -o lib/presentation/destinations/notes --name notesList 
```
`-o` flag sets the output directory for the `brick` and `--name` is the name used for the files and classes. This brick generates the required file structure and runs `build_runner` (via mason hooks) to trigger code generation. After running the command, this is what you should see:

<img width="408" alt="Screenshot 2023-03-21 at 2 55 45 PM" src="https://user-images.githubusercontent.com/58199625/226564828-3172bc70-5324-486c-a31d-6ce7f19aa8bb.png">

## Testing

The template also includes a testing setup for
- [`Unit Tests`](test/repository).
- [`Widget Tests`](test/presentation/integration)
- [`Golden Tests`](test/presentation/goldens)

The test coverage and code quality reporting is done using [`sonarqube`](https://docs.sonarqube.org/latest/).
You can read the documentation about integrating `sonarqube` in you CI workflow [here](https://docs.sonarqube.org/latest/devops-platform-integration/github-integration/#analyzing-projects-with-github-actions).

## Content
The Flutter Template contains:
- A [`Flutter`](https://flutter.dev/) application.
- Built-in support for 3 [`flavors`](https://docs.flutter.dev/deployment/flavors) - `dev`, `qa` and `prod`.
- A [`reactive base architecture`](#architecture) for your application.
- [`Riverpod`](https://riverpod.dev/) along with [`state_notifier`](https://pub.dev/packages/state_notifier) for state management.
- [`Drift`](https://drift.simonbinder.eu/) as local database for storage.
- [`Dio`](https://github.com/flutterchina/dio) for making API calls.
- [`Freezed`](https://pub.dev/packages/freezed) for data class functionality.
- [`Get It`](https://pub.dev/packages/get_it) for dependency injection.
- [`Flutter Lints`](https://pub.dev/packages/flutter_lints) for linting.
- [`derry`](https://pub.dev/packages/derry) for script management.
- [`mason`](https://pub.dev/packages/mason_cli) for templating.
- [`sonarqube`](https://docs.sonarqube.org/latest/) for code inspection.

The template contains an example (displaying weather data) with responsive widgets, reactive state management, offline storage and api calls.

## Continuous Integration and Deployment
The Flutter template comes with built-in support for CI/CD using Github Actions.

### CI
The [`CI`](.github/workflows/ci.yml) workflow performs the following checks on every pull request:
- Lints the code with `flutter analyze`.
- Check formatting with `dart format`
- Runs tests using `flutter test`.
- Run golden test.
- Report code coverage and code quality using `sonarqube`.
- Build the android app.
- Build the ios app.

You can read the documentation about integrating `sonarqube` in you CI workflow [here](https://docs.sonarqube.org/latest/devops-platform-integration/github-integration/#analyzing-projects-with-github-actions).

### CD
The [`CD`](.github/workflows/cd.yml) workflow performs the following actions:
- Bump the build number by 1.
- Build a signed release apk.
- Upload apk to the app center.
- Upload apk as artifact to release tag.
- Build a signed iOS app.
- Upload ipa to testflight.
- Upload the ipa as an artifact to release the tag.
- Commit the updated version to git.

### .env files on CD
The CI and CD workflows grab the `.env` files from github secrets. The secrets are name `ENV_` followed by environment name.
So for dev the secret name is `ENV_DEV`, qa is `ENV_QA` and prod is `ENV_PROD`.
Convert your `.env` files with all the api keys populated to base64 strings and set them as secrets on github with the appropriate secret name.
You can learn more about github actions secrets [here](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

### Android CD setup
For the android CD workflow to run, we need to perform the following setup steps:
- Follow these instructions to [generate an upload keystore](https://developer.android.com/studio/publish/app-signing#generate-key). Note down the `store password`, `key alias` and `key password`. You will need these in later steps.
- Use `openssl` to convert the `jks` file to `Base64`.
```shell
openssl base64 < flutter_template_keystore.jks | tr -d '\n' | tee flutter_template_keystore_encoded.txt
```
- Store the `base64` output on [`Github Secrets`](https://docs.github.com/en/actions/security-guides/encrypted-secrets) with the key name `KEYSTORE`.
- Save the `store password` in github secrets with the key name `RELEASE_STORE_PASSWORD`.
- Save the `key alias` in github secrets with the key name `RELEASE_KEY_ALIAS`.
- Save the `key password` in github secrets with the key name `RELEASE_KEY_PASSWORD`.
- [Create a distribution on app center](https://docs.microsoft.com/en-us/appcenter/distribution/) and get the upload key. You can get it from appcenter.ms/settings.
- Save the app center upload key on github secrets with key name `APP_CENTER_TOKEN`.


### IOS CD Setup
For the IOS job in the `cd.yml` to run, you first need to have a valid [Apple Developer Account](https://developer.apple.com/).If you don't have it yet, please create one before proceeding further

We will divide the guide into steps so that it is easier to understand

#### Step 1: Setup on the AppStore
- Register your `Bundle ID`. You can view the official Flutter guide [here](https://docs.flutter.dev/deployment/ios#register-a-bundle-id)
> CAUTION: Apple doesn't allow underscore in the bundle identifier. Read about valid identifiers [here](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleidentifier)
- Create an application on the AppStore Connect Portal. Check out the official guide [here](https://docs.flutter.dev/deployment/ios#create-an-application-record-on-app-store-connect)

#### Step 2: Getting a Distribution Certificate and Provisioning Profile
- Create a `Distribution Certificate` for your machine locally once. You can refer to [this](https://support.magplus.com/hc/en-us/articles/203808748-iOS-Creating-a-Distribution-Certificate-and-p12-File) guide. Download the `.p12` file for use later. Remember the password used to create this certificate as we will need this later
- Create a `Provisioning Profile` for your `Bundle ID` you registered above. You can refer to [this](https://support.staffbase.com/hc/en-us/articles/115003598691-Creating-the-iOS-Provisioning-Profiles) guide. Download the profile for use later.

#### Step 3: Getting the options.plist
- In the following template
   - Replace `BUNDLE ID` with your `Bundle Identifier` (You got that already from Step 1)
   - Replace `PROVISIONING PROFILE NAME` with your Provisioning Profile Name (You already created one in Step 2, use that)
   - Replace `TEAM_ID` with your team id. Look at [this](https://stackoverflow.com/a/18727947) answer on "How to find your Team ID"
<details>
<summary><i>Click to View Template</i></summary>

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>generateAppStoreInformation</key>
	<false/>
	<key>manageAppVersionAndBuildNumber</key>
	<true/>
	<key>method</key>
	<string>app-store</string>
	<key>provisioningProfiles</key>
	<dict>
		<key>BUNDLE-ID</key>
		<string>PROVISION PROFILE NAME</string>
	</dict>
	<key>signingCertificate</key>
	<string>Apple Distribution</string>
	<key>signingStyle</key>
	<string>manual</string>
	<key>stripSwiftSymbols</key>
	<true/>
	<key>teamID</key>
	<string>TEAM_ID</string>
	<key>uploadBitcode</key>
	<false/>
	<key>uploadSymbols</key>
	<true/>
</dict>
</plist>
```
</details>

- Create a new file called `options.plist` and save the above contents in that file

#### Step 4: Making an app specific password
- Read the [official guide](https://support.apple.com/en-us/HT204397) to create an app specific password and remember it(;P)
- The pipeline uses this password to upload an ipa to testflight

#### Step 5: Bringing it all together
- Add the following keys to [Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
  - `BUILD_CERTIFICATE_BASE64` : The base64 of the p12 file we generated(Step 2)
  - `P12_PASSWORD`: The password of the p12 certificate generated above in Step 2
  - `BUILD_PROVISION_PROFILE_BASE64`: The provisioning profile in base64(Step 2)
  - `KEYCHAIN_PASSWORD` : The password used to store the keychain in the local keystore of the Github Runner(Any random value)
  - `IOS_PLIST`: The options.plist file needed to make an ipa out of the xcarchive generated by flutter(Step 3)
  - `APPSTORE_PASSWORD`: The password passed to altool to upload the ipa to the store(Step 4)
- To generate a base64 string, use the following command, replacing `FILENAME` with your filename

```shell
openssl base64 < FILENAME | tr -d '\n' | tee ENCODED_FILENAME.txt
```

### Pushing to protected branches
- If the branches that you will be running CD on are protected, you will need to use a [`Personal Access Token (PAT)`](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) to commit the version changes.
- After creating the `PAT`, exclude the account that the token belongs to from the [`branch protection rules`](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule#creating-a-branch-protection-rule).
- Save the token in github secrets and update the key name in the `cd.yml` file under each `checkout` action.
- Since our `CD` workflow is triggered on a push, and we create a new commit in the workflow itself, the commit message created by the `CD` workflow includes `[skip ci]` tag so that the workflow does not end up in an infinite loop. Read more about this [here](https://docs.github.com/en/actions/managing-workflow-runs/skipping-workflow-runs)

**If you do not plan to use the CD workflow on protected branches, you can remove the token part from the checkout actions.**

## Gotchas

#### Refresh Rate
Flutter apps might have issues on some android devices with variable refresh rate where the app is locked at 60fps instead of running at the highest refresh rate. This might make your app look like it is running slower than other apps on the device. To fix this the template uses the [`flutter_displaymode`](https://pub.dev/packages/flutter_displaymode) package. The template sets the highest refresh rate available. If you don't want this behaviour you can remove the lines 40 to 46 in [`app.dart`](lib/app.dart#L40). [`Link to frame rate issue on flutter`](https://github.com/flutter/flutter/issues/35162).

#### Golden Tests
Golden test screenshots (goldens) are rendered using the rendering mechanisms on the os that you are running the tests on. Because of the slight differences in each os, the goldens generated on each os differ slightly from each other. Goldens generated on macos won't match exactly to the goldens generated on windows or linux and your tests will fail.
To work around this, make sure to generate goldens and run golden tests on a single os. This template uses macos as it's os of choice to deal with goldens. You will find that on [CI](.github/workflows/ci.yml), the golden tests are run on a macos host.

- `What if your team members use different operating systems for development?` - In that case, the devs not using your os of choice should have a way to generate goldens on your os of choice. This template has a [`update_goldens`](.github/workflows/update_goldens.yml) workflow that can be manually triggered on any branch. It will generate the golden files on macos and commit the changes to the same branch.

## License
Flutter Template is licensed under the MIT license. Check the [LICENSE](LICENSE) file for details.

## Other Versions
##### Check out the [multi-package branch](https://github.com/wednesday-solutions/flutter_template/tree/multi-package) for a multi package flutter architecture.

