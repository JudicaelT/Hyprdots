import { Gtk } from "astal/gtk3"
import { Variable, bind } from "astal"
import Hyprland from "gi://AstalHyprland"
import { togglePanel } from "./Panel"

export default function Bar() {
    return <box>
        <centerbox vertical className="Bar">
            <box vertical valign={Gtk.Align.START}>
                <Profile />
                <Separator />
                <ToolBox />
            </box>
            <box vertical valign={Gtk.Align.CENTER}>
                <Workspaces />
            </box>
            <box vertical valign={Gtk.Align.END}>
                <Settings />
                <Clock />
            </box>
        </centerbox>
        <box vertical className="bar-corners" />
    </box>
}

function Profile() {
    return <label className="Profile"></label>
}

function Separator() {
    return <box className="Separator"></box>
}

function ToolBox() {
    return <box className="ToolBox" vertical>
        <button><label>󰄄</label></button>
        <button><label>󰈊</label></button>
    </box>
}

function Workspaces() {
    const hypr = Hyprland.get_default()
    return <box className="Workspaces" vertical>
        {bind(hypr, "workspaces").as(workspaces =>
            workspaces
                .filter(workspace => !(workspace.id >= -99 && workspace.id <= -2)) // filter out special workspaces
                .sort((a, b) => a.id - b.id)
                .map(workspace => (
                    <button
                        className={
                            bind(hypr, "focusedWorkspace").as(focused => {
                                let className: string = ""
                                if (workspace === focused) className += " focused"
                                if (workspace.get_clients().length == 0) className += " empty"
                                return className
                            })
                        }
                        onClicked={() => workspace.focus()}>
                        {bind(hypr, "focusedWorkspace").as(focused => workspace === focused ? "󰺕" : "󰄰")}
                    </button>
                ))
        )}
    </box>
}

function Settings() {
    const toggleSettingsPanel = function() {
        togglePanel();
        console.log("this was clicked")
    }
    return <button className="Settings" onClick={toggleSettingsPanel}>
        <box vertical halign="center" valign="center">
            <label className="brightness">󰃟</label>
            <label className="volume"></label>
            <label className="network">󰤢</label>
            <label className="bluetooth"></label>
        </box>
    </button>
}

function Clock() {
    const time: Variable<string> = Variable("").poll(1000, "date +\"%H\n%M\"")
    return <button className="Clock">{time()}</button>
}
