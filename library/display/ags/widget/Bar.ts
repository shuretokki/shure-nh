import { Astal, Gtk, Gdk } from "astal/gtk3"

export default function Bar(monitor: number) {
    return new Gtk.Window({
        name: "Bar",
        className: "Bar",
        monitor: monitor,
        anchor: Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
        exclusivity: Astal.Exclusivity.EXCLUSIVE,
        child: new Gtk.CenterBox({
            startWidget: new Gtk.Label({ label: "Start" }),
            centerWidget: new Gtk.Label({ label: "Center" }),
            endWidget: new Gtk.Label({ label: "End" }),
        }),
    })
}
