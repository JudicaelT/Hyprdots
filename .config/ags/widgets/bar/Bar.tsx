import { Gdk, Gtk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time";

const cursorPointer = Gdk.Cursor.new_from_name("pointer", null);

export default function Bar() {
    return <box orientation={Gtk.Orientation.VERTICAL}>
        <box class="bar-corners" />
        <centerbox
            class="Bar"
            hexpand
            vexpand
        >
            <box halign={Gtk.Align.START} valign={Gtk.Align.CENTER} $type="start">
                <Monitoring />
            </box>
            <box halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} $type="center">
                <ToolBox />
            </box>
            <box halign={Gtk.Align.END} valign={Gtk.Align.CENTER} $type="end">
                <Settings />
                <Separator />
                <Clock />
            </box>
        </centerbox>
    </box>
}

function Monitoring() {
    const memoryUsage = createPoll(
        "",
        3000,
        ["bash", "-c", "free | grep Mem | awk '{printf \"%.0f\", ($3/$2)*100}'"],
    )
    const cpuUsage = createPoll(
        "",
        3000,
        ["bash", "-c", "vmstat 1 2 | tail -1 | awk '{printf \"%.0f\", (100 - $15)}'"],
    )
    const remainingBattery = createPoll(
        "",
        3000,
        ["bash", "-c", "cat /sys/class/power_supply/BAT0/capacity"],
    )
    return <box class="Monitoring">
        <label label={memoryUsage((p) => `RAM: ${p}%`)} />
        <label label={cpuUsage((p) => `CPU: ${p}%`)} />
        <label label={remainingBattery((p) => `BAT: ${p}%`)} />
    </box>
}

function ToolBox() {
    const takeScreenshot = async () => {
        await execAsync("hyprshot -m region --clipboard-only")
            .catch(() => console.log("screenshot canceled"))
    }
    const pickColor = async () => {
        await execAsync("hyprpicker --autocopy --quiet")
            .catch(() => console.log("color picking canceled"))
    }
    return <box class="ToolBox">
        <button cursor={cursorPointer} onClicked={takeScreenshot}><label label="󰄀" /></button>
        <button cursor={cursorPointer} onClicked={pickColor}><label label="󰈊" /></button>
        <button cursor={cursorPointer}><label label="" /></button>
        <button cursor={cursorPointer}><label label="󰹉" /></button>
    </box>
}

function Settings() {
    return <button cursor={cursorPointer} class="Settings">
        <box>
            <label label="󰃟" />
            <label label="󰤢" />
            <label label="" />
            <label label="" />
            <label label="" />
        </box>
    </button>
}

function Separator() {
    return <box class="Separator"></box>
}

function Clock() {
    const time = createPoll("", 1000, "date +\"%H:%M\"")
    return <button cursor={cursorPointer} class="Clock">
        <label label={time((t) => ` ${t}`)} />
    </button>
}
