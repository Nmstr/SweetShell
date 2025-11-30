//@ pragma UseQApplication
import Quickshell
import Quickshell.Io

Scope {
    Background {}
    Bar {}

    FileView {
        path: Quickshell.cacheDir + "/../../../../.config/SweetShell/config.json"  // very hacky but QuickShell does not provide a clean way to access the config dir
        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: configFile
            property string wallpaperPath: ""
        }
    }
}
