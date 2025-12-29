import { App } from "astal/gtk3"
import Bar from "./widget/Bar"
import WallpaperPicker from "./widget/WallpaperPicker"

App.start({
    instanceName: "ags",
    requestHandler(request, res) {
        res("ok")
    },
    main() {
        App.get_monitors().map(Bar)
        App.get_monitors().map(WallpaperPicker)
    },
})
