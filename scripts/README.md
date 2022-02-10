## Scripts Setup

#### Git Hooks

- Run the following command to make the `setup-hooks` script executable

```console
chmod +x ./scripts/setup-hooks.sh
```

- Then run the `setup-hooks` script. This will setup the git hooks.

```console
./scripts/setup-hooks.sh
```

## Development Scripts

These are the scripts that you will run manually during development.

#### Make sure you have run `flutter pub get` before running these commands.

#### Build Runner

Run the following command to trigger build for all generated dart files.

```console
scripts/build-runner.sh
```

#### Generate Translations

Run the following command to generate translations from the json files in assets/translations.

```console
scripts/generate-translations.sh
```

#### Generate All

This will generate all dart files along with translations. It basically runs build runner and
generate translations

```console
scripts/generate-all.sh
```

#### Run

Run the app on a device or an emulator.

```console
scripts/run.sh [flavor] [--build-type]
```

- flavor: `dev, qa, prod`
- build-type: `debug, profile, release`. Defaults to `debug`. Example:

```console
scripts/run.sh dev --debug
```

#### Build

```console
scripts/build.sh [file-format] [flavor] [--build-type] [--additional-flag]
```

- file-format: `apk, appbundle, ios`.
- flavor: `dev, qa, prod`.
- build-type: `debug, profile, release`. Defaults to `debug`.
- additional-flag: Any addition flag to pass to the `flutter build` command. Defaults to no flag.
  Example:

```console
scripts/build.sh ios prod --release --no-codesign
```

#### Device Preview

Runs the flutter app's dev flavor with the device preview package enabled. Device preview let's you
test how an app will look on various devices, orientations, etc.

```console
scripts/device-preview.sh
```

## Github Action Scripts

These scripts are used by github actions CI/CD.

#### Bump Build Number

Bumps the `versionCode/buildNumber` by 1 in `pubspec.yaml` file. For example, it will
change `version: 1.2.5+12` to `version: 1.2.5+13`.

```console
scripts/bump-build-number.sh
```

#### Set Current Version to ENV

Sets the current version from `pubspec.yaml` to the github actions environment variables.

```console
scripts/gh-action-read-and-set-version-env.sh
```

#### Commit Version

Reads the version from `pubspec.yaml` and creates a commit with the message "Bump version to (
version)". Then push the change to the current branch.

```console
scripts/commit-version.sh
```