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
The architecture is separeted into the following layers
- [`lib/presentation`](lib/presentation): All UI and state management elements like widgets, pages and view models.
- [`lib/presentation/destinations`](lib/presentation/destinations): Navigatable destinations in the app. 
- [`lib/navigation`](lib/navigation): navigators to navigate between destinations.
- [`lib/interactor`](lib/interactor): provides feature specific functionality.
- [`lib/domain`](lib/domain): use cases for individual pieces of work.
- [`lib/repository`](lib/repository): repositories to manage various data sources.
- [`lib/services`](lib/services): services provide access to external elements such as databases, apis, etc.

Apart from these layers, the template has
- [`lib/foundation`](lib/foundation): Extentions on primitive data types, loggers, global type alias etc.
- [`lib/flavors`](lib/flavors): Flavor i.e. Environment reledated classes.
- [`lib/entrypoints`](lib/entrypoints): Target files for flutter to run for each flavor.
- [`lib/app.dart`](lib/app.dart): App initialization code.
