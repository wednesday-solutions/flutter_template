<img align="left" src="https://github.com/wednesday-solutions/flutter_template/blob/master/flutter_template_github.svg" width="480" height="440" />

<div>
  <a href="https://www.wednesday.is?utm_source=gthb&utm_medium=repo&utm_campaign=serverless" align="left"><img src="https://uploads-ssl.webflow.com/5ee36ce1473112550f1e1739/5f5879492fafecdb3e5b0e75_wednesday_logo.svg"></a>
  <p>
    <h1 align="left">Flutter Template</h1>
  </p>
  <p>
  A Flutter template application showcasing - Clean architecture, Responsive design, State management, Dependency Injection, Widget and Unit testing, Navigation, Localization, Continuous Integration and Continuous Deployment.
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

## Getting Started
Clone the repo and run the following commands to setup the project.

#### Get Dependencies
```shell
flutter pub get
```
#### Run Code Generation
```shell
scripts/generate-all.sh
```

Read the [scripts documentation](scripts/README.md) to learn about all the scrips used in the project.

## Architecture
The architecture of the template facilitates seperation of concerns and avoids tight coupling between it's various layers. The goal is to have the ability to make changes to individual layers without affecting the entire app. This architecture is an adaptation of concepts from [`The Clean Architecture`](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

### Layers
The architecture is separeted into the following layers
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
- [`lib/domain/entity`](lib/domain/entity): Model classes for performing business logic manipulations. They act as a abstraction to hide the local and remote data models.
- [`lib/services/entity`](lib/services/entity): Contains local models (data classes for the database) and remote models (data classes for the api).

#### Entity Naming Convention
- Presentation entities are prefixed with `UI` (eg: UICity).
- Domain entites do not have any prefix. (eg: City).
- Service entities are of 2 types:
  - Local / Database entites are prefixed with `Local` (eg: LocalCity).
  - Remote / API entitiess are prefixed with `Remote` (eg: RemoteCity).

### Other Directories
Apart from the main layers, the template has
- [`lib/foundation`](lib/foundation): Extentions on primitive data types, loggers, global type alias etc.
- [`lib/flavors`](lib/flavors): Flavor i.e. Environment reledated classes.
- [`lib/entrypoints`](lib/entrypoints): Target files for flutter to run for each flavor.
- [`lib/app.dart`](lib/app.dart): App initialization code.

## Understanding the Presentation Layer
The presentation layer houses all the visual components and state management logic.

The [`base`](lib/presentation/base) directory has all the resuable and common elements used as building blocks for the UI like common widgets, app theme data, exceptions, base view models etc.

### View Model
State Management is done using the [`riverpod`](https://riverpod.dev/) along with [`state_notifier`](https://pub.dev/packages/state_notifier). The class that manages state is called the `View Model`. 

Each `View Model` is a sub class of the `BaseViewModel`. The [`BaseViewModel`](lib/presentation/base/view_model_provider/base_view_model.dart) is a `StateNotifier` of [`ScreenState`](#screen-state). Along with the ScreenState it also exposes a stream of [`Effect`](#effect). 

Implementations of the BaseViewModel can also choose to handle [`Intents`](#intent).

### Screen State
[`ScreenState`](lib/presentation/entity/screen/screen_state.dart) encapsulates all the state required by a [`Page`](#page). State is any data that represents the current situtation of a Page.

For example, the [`HomeScreenState`](lib/presentation/destinations/weather/home/home_screen_state.dart) holds the state required by the [`HomePage`](lib/presentation/destinations/weather/home/home_page.dart).

### Effect
[`Effects`](lib/presentation/entity/effect/effect.dart) are events that take place on a page that are not part of the state of the screen. These usually deal with UI elements that are not part of the widget tree.

Showing a snackbar or hiding the keyboard are examples of an effect.


### Intent
Intent is any action takes place on page. It may or may not be user initiated. 

[`SearchScreenIntent`](lib/presentation/destinations/weather/search/search_screen_intent.dart) has the actions that can happen on the [`SearchPage`](lib/presentation/destinations/weather/search/search_page.dart).

### Page
A page is a widget that the navigator can navigate to. It should return the [`BasePage`](lib/presentation/base/page/base_page.dart) widget. 

The `BasePage` creates the structure for the page, initialises the [`ViewModel`](#view-model) and provides the view model in the widget tree so that all the children have access to it. It also listens to the effects from the view model and notifies the page about it.

Each page accepts the [`Screen`](#screen) object as input.

### Screen
A [`Screen`](lib/presentation/entity/screen/screen.dart) is a class that represents a `Page` in the context of navigation. It holds the `path` used by the navigator to navigate to a `Page` and also holds any arguments required to navigate to that `Page`.
 

