# plushu-apps

Implements commands for manipulating apps.

## apps

Lists existing apps.

## apps:create

Usage: `plushu apps:create [app]`

Creates an app. This command will still take a named app parameter on the
command line, to override an app name specified by other means (eg. the `--app`
long option).

## apps:destroy

Usage: `plushu apps:destroy [app]`

Deletes an app and any data attached to that app.

## apps:fork

Usage: `plushu apps:destroy [app] <new-app>`

Copies an app. Does *not* copy data attached to that app, such as
configuration - other data, such as repos, may be copied by other plugins (see
note on "Attached data" below).

## apps:rename

Usage: `plushu apps:destroy [app] <new-name>`

Renames an app and any data attached to that app.

### Renaming with pluchu

Note that [pluchu][] reads the name of the app from the target when executing a
command. To rename the app for future requests, you need to update the remote
URL in your local config after renaming the app:

```
pluchu apps:rename <new name>
git remote set-url plushu `git remote show plushu | sed 's/:[^:]*$/:<new name>/'`
```

If you've already renamed your repository in the local remote configuration,
you can explicitly set the name of the old repository when executing
`apps:rename`:

```
pluchu --app <old name> apps:rename <new name>
```

[pluchu]: https://github.com/plushu/pluchu

## Notes

### App arguments

Note that each of these commands may have their app specified in other ways
implemented by other plugins, such as the `--app` long option provided by
[plushu/plushu-app-long-opt][].

[plushu/plushu-app-long-opt]: https://github.com/plushu/plushu-app-long-opt

If the app is specified in this way, the positional `[app]` parameter described
in a command's Usage will be skipped, and any further positional parameters
will start in its place (except for `apps:create` as noted below).

### Attached data

"attached data" refers to data kept in the app's directory in
`PLUSHU_APPS_DIR`, as well as data managed by a plugin that hooks into the app
events triggered by these commands. For repos, these hooks only affect repos
when a plugin like the [plushu/plushu-app-repo-binding][] plugin is installed.

[plushu/plushu-app-repo-binding]: https://github.com/plushu/plushu-app-repo-binding
