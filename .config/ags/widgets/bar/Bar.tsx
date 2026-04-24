import Gtk from "gi://Gtk?version=3.0";
import { Variable, execAsync } from "astal"
import { togglePanel } from "./Panel"

export default function Bar(): Gtk.Widget {
    return <box vertical>
        <box className="bar-corners" />
        <centerbox className="Bar">
            <box halign={Gtk.Align.START} valign={Gtk.Align.CENTER}>
                <Monitoring />
            </box>
            <box halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER}>
                <ToolBox />
            </box>
            <box halign={Gtk.Align.END} valign={Gtk.Align.CENTER}>
                <Settings />
                <Separator />
                <Clock />
            </box>
        </centerbox>
    </box>
}

function Monitoring(): Gtk.Widget {
    const memoryUsage = Variable("").poll(
        3000,
        ["bash", "-c", "free | grep Mem | awk '{printf \"%.0f\", ($3/$2)*100}'"],
    )
    const cpuUsage = Variable("").poll(
        3000,
        ["bash", "-c", "vmstat 1 2 | tail -1 | awk '{printf \"%.0f\", (100 - $15)}'"],
    )
    const remainingBattery = Variable("").poll(
        3000,
        ["bash", "-c", "cat /sys/class/power_supply/BAT0/capacity"],
    )
    return <box className="Monitoring">
        <label label={memoryUsage((p) => `RAM: ${p}%`)} />
        <label label={cpuUsage((p) => `CPU: ${p}%`)} />
        <label label={remainingBattery((p) => `BAT: ${p}%`)} />
    </box>
}

function ToolBox(): Gtk.Widget {
    const takeScreenshot = async () => {
        await execAsync("hyprshot -m region --clipboard-only")
            .catch(() => console.log("screenshot canceled"))
    }
    const pickColor = async () => {
        await execAsync("hyprpicker --autocopy --quiet")
            .catch(() => console.log("color picking canceled"))
    }
    return <box className="ToolBox">
        <button cursor="pointer" onClicked={takeScreenshot}><label>󰄀</label></button>
        <button cursor="pointer" onClicked={pickColor}><label>󰈊</label></button>
        <button cursor="pointer"><label></label></button>
        <button cursor="pointer"><label>󰹉</label></button>
    </box>
}

function Settings(): Gtk.Widget {
    const toggleSettingsPanel = function() {
        togglePanel();
        console.log("this was clicked")
    }
    return <button cursor="pointer" className="Settings" onClick={toggleSettingsPanel}>
        <box halign="center" valign="center">
            <label>󰃟</label>
            <label>󰤢</label>
            <label></label>
            <label></label>
            <label></label>
        </box>
    </button>
}

function Separator(): Gtk.Widget {
    return <box className="Separator"></box>
}

function Clock(): Gtk.Widget {
    const time: Variable<string> = Variable("").poll(1000, "date +\"%H:%M\"")
    return <button cursor="pointer" className="Clock">
        <label label={time((t) => ` ${t}`)} />
    </button>
}
