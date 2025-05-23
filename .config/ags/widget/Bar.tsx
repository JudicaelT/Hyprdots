import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, bind } from "astal"
import Hyprland from "gi://AstalHyprland"

function Profile() {
    return <label className="Profile"></label>
}

function Separator() {
    return <box className="Separator"></box>
}

function Diagnostics() {
    const memoryUsage = Variable("").poll(
        3000,
        ["bash", "-c", "free | grep Mem | awk '{print $3 / $2}'"],
    )
    const cpuUsage = Variable("").poll(
        3000,
        ["bash", "-c", "vmstat 1 2 | tail -1 | awk '{printf \"%.2f\", (100 - $15)/100}'"],
    )

    return <box className="Diagnostics" vertical>
        <box>
            <circularprogress value={memoryUsage()} startAt={-0.25} endAt={0.75}>
                <label>󰍛</label>
            </circularprogress>
        </box>
        <box>
            <circularprogress value={cpuUsage()} startAt={-0.25} endAt={0.75}>
                <label>󰻠</label>
            </circularprogress>
        </box>
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
                                const isWorkspaceActive: boolean = workspace === focused
                                const isWorkspaceEmpty: boolean = workspace.get_clients().length == 0

                                if (isWorkspaceActive) className += " focused"
                                if (isWorkspaceEmpty) className += " empty"

                                return className
                            })
                        }
                        onClicked={() => workspace.focus()}>
                        {
                            bind(hypr, "focusedWorkspace").as(focused => workspace === focused ? "󰺕" : "󰄰")
                        }
                    </button>
                ))
        )}
    </box>
}

function Settings() {
    return <button className="Settings">
        <box vertical halign="center" valign="center">
            <label className="brightness">󰃟</label>
            <label className="volume"></label>
            <label className="network">󰤢</label>
            <label className="bluetooth"></label>
        </box>
    </button>
}

function Clock() {
    const time = Variable("").poll(1000, "date +\"%H\n%M\"")
    return <button className="Clock">{time()}</button>
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { LEFT, TOP, BOTTOM } = Astal.WindowAnchor
    return <window
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={LEFT | TOP | BOTTOM}
        application={App}>
        <box>
            <centerbox vertical>
                <box vertical valign={Gtk.Align.START}>
                    <Profile />
                    <Separator />
                    <Diagnostics />
                </box>
                <box vertical valign={Gtk.Align.CENTER}>
                    <Workspaces />
                </box>
                <box vertical valign={Gtk.Align.END}>
                    <Settings />
                    <Clock />
                </box>
            </centerbox>
            <box vertical className="bar-corners"></box>
        </box>
    </window>
}
