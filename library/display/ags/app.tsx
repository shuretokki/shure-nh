import app from "ags/gtk3/app"
import { Gdk } from "ags/gtk3"
import Bar from "./widget/Bar"
import WallpaperPicker from "./widget/WallpaperPicker"

app.start({
    css: "/home/shure/shuredotnix/library/display/ags/style.css",
    main() {
        const display = Gdk.Display.get_default()
        if (display) {
            for (let i = 0; i < display.get_n_monitors(); i++) {
                Bar(i)
                WallpaperPicker(i)
            }
        }
    },
})
