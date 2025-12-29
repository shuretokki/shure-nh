import { Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"
import Mpris from "gi://AstalMpris"
import Network from "gi://AstalNetwork"
import Wp from "gi://AstalWp"
import Battery from "gi://AstalBattery"
import { Variable, GLib } from "astal"

function Workspaces() {
    const hypr = Hyprland.get_default()

    return new Gtk.Box({
        className: "Workspaces",
        children: Array.from({ length: 5 }, (_, i) => i + 1).map(id => new Gtk.Button({
            className: "workspace-button",
            onClicked: () => hypr.dispatch("workspace", `${id}`),
            setup: (self) => {
                const update = () => {
                    self.toggleClassName("active", hypr.focusedWorkspace.id === id)
                    self.toggleClassName("occupied", (hypr.get_workspace(id)?.get_clients().length || 0) > 0)
                }
                hypr.connect("notify::focused-workspace", update)
                hypr.connect("client-added", update)
                hypr.connect("client-removed", update)
                update()
            },
            child: new Gtk.Label({ label: `${id}` })
        }))
    })
}

function Media() {
    const mpris = Mpris.get_default()

    return new Gtk.Box({
        className: "Media",
        setup: (self) => {
            const update = () => {
                const player = mpris.get_players()[0]
                if (player) {
                    self.visible = true
                    self.children = [
                        new Gtk.Label({
                            label: `${player.title} - ${player.artist}`,
                            maxWidthChars: 30,
                            ellipsize: 3,
                        })
                    ]
                } else {
                    self.visible = false
                }
            }
            mpris.connect("player-added", update)
            mpris.connect("player-removed", update)
            update()
        }
    })
}

function SysTray() {
    const network = Network.get_default()
    const audio = Wp.get_default()?.audio
    const battery = Battery.get_default()

    return new Gtk.Box({
        className: "SysTray",
        spacing: 10,
        children: [
            new Gtk.Label({
                setup: (self) => {
                    const update = () => {
                        if (network.wifi) {
                            self.label = network.wifi.ssid ? "" : "󰖪"
                        } else {
                            self.label = "󰈀"
                        }
                    }
                    network.connect("notify::wifi", update)
                    update()
                }
            }),
            new Gtk.Label({
                setup: (self) => {
                    const update = () => {
                        if (audio?.defaultSpeaker) {
                            const vol = Math.round(audio.defaultSpeaker.volume * 100)
                            self.label = audio.defaultSpeaker.mute ? "󰝟" : `󰕾 ${vol}%`
                        }
                    }
                    audio?.connect("notify::default-speaker", update)
                    update()
                }
            }),
            new Gtk.Label({
                setup: (self) => {
                    const update = () => {
                        self.label = battery.charging ? "󰂄" : "󰁹"
                        self.tooltipText = `${Math.round(battery.percentage * 100)}%`
                    }
                    battery.connect("notify::percentage", update)
                    battery.connect("notify::charging", update)
                    update()
                }
            }),
            new Gtk.Label({
                className: "Clock",
                setup: (self) => {
                    const update = () => {
                        self.label = GLib.DateTime.new_now_local().format("%H:%M") || ""
                    }
                    GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 1, () => {
                        update()
                        return true
                    })
                    update()
                }
            })
        ]
    })
}

export default function Bar(monitor: number) {
    return new Gtk.Window({
        name: `bar-${monitor}`,
        className: "Bar",
        monitor: monitor,
        anchor: Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
        exclusivity: Astal.Exclusivity.EXCLUSIVE,
        child: new Gtk.CenterBox({
            startWidget: Workspaces(),
            centerWidget: Media(),
            endWidget: SysTray(),
        }),
    })
}
