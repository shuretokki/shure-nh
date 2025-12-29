/** @jsxImportSource ags/gtk3 */
import { Astal, Gtk, Gdk } from "ags/gtk3"
import app from "ags/gtk3/app"
import { exec, execAsync } from "ags/process"
import { createState } from "ags"
import GLib from "gi://GLib"

const WP_DIR = `${GLib.get_home_dir()}/shure-wp`

export default function WallpaperPicker(monitor: number) {
    const [transition, setTransition] = createState("fade")
    const [selectedMonitor, setSelectedMonitor] = createState("all")

    const transitions = [
        "none", "fade", "left", "right", "top", "bottom", "wipe", "wave", "grow", "center", "any", "outer", "random"
    ]

    const getWallpapers = () => {
        try {
            return exec(`ls ${WP_DIR}`).split("\n").filter(f => f.match(/\.(jpg|jpeg|png|webp|gif)$/i))
        } catch (e) {
            return []
        }
    }

    const wallpapers = getWallpapers()

    return <window
        name={`wallpaper-picker-${monitor}`}
        class="WallpaperPicker"
        monitor={monitor}
        application={app}
        visible={false}
        keymode={Astal.Keymode.EXCLUSIVE}
        onKeyPressEvent={(self, event: Gdk.EventKey) => {
            if (event.keyval === Gdk.KEY_Escape) {
                self.hide()
            }
        }}>
        <box vertical spacing={20}>
            <label class="picker-title" label="Wallpaper Picker" />
            <box class="picker-controls" spacing={10}>
                <label label="Transition:" />
                <Gtk.ComboBoxText
                    active={1}
                    onChanged={(self) => setTransition(self.get_active_text() || "fade")}
                    $={(self) => transitions.forEach(t => self.append_text(t))}
                />
                <label label="Monitor:" />
                <Gtk.ComboBoxText
                    active={0}
                    onChanged={(self) => setSelectedMonitor(self.get_active_text() || "all")}
                    $={(self) => {
                        self.append_text("all")
                        try {
                            const monitors = JSON.parse(exec("hyprctl monitors -j"))
                            monitors.forEach((m: any) => self.append_text(m.name))
                        } catch (e) { }
                    }}
                />
            </box>
            <Gtk.ScrolledWindow class="picker-scroll" minContentHeight={400} minContentWidth={600}>
                <Gtk.FlowBox
                    class="picker-grid"
                    minChildrenPerLine={3}
                    maxChildrenPerLine={6}
                    $={(self) => {
                        wallpapers.forEach((wp: string) => {
                            const path = `${WP_DIR}/${wp}`
                            const btn = (<button
                                class="wp-button"
                                onClicked={() => {
                                    const m = selectedMonitor()
                                    const t = transition()
                                    const cmd = m === "all"
                                        ? `swww img "${path}" --transition-type ${t}`
                                        : `swww img -o ${m} "${path}" --transition-type ${t}`
                                    execAsync(cmd)
                                }}>
                                <box vertical>
                                    <Gtk.Image file={path} pixelSize={150} />
                                    <label label={wp} maxWidthChars={15} ellipsize={3} />
                                </box>
                            </button>) as any
                            self.add(btn)
                        })
                    }}
                />
            </Gtk.ScrolledWindow>
            <button
                class="picker-close"
                label="Close"
                onClicked={() => exec(`ags toggle wallpaper-picker-${monitor}`)}
            />
        </box>
    </window>
}
