// DO NOT EDIT.
// This import will be edited when build of ios by scripts/build.sh
// This file is ignored in git for any further modifications.
// To add file to git again run 'git update-index --no-skip-worktree lib/main.dart'
import 'package:flutter_template/entrypoints/main_prod.dart' as entrypoint;

/// Running `flutter build ios` has an error currently where
/// the `generated_main.dart` file does not point to the
/// correct target (-t) defined in the build command.
/// It always points to `main.dart` thus this file is used
/// until a fix is released.
void main() {
  entrypoint.main();
}
