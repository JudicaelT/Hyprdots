import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import Workspaces from "../widgets/workspaces/Workspaces"

export default function RightSide(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, BOTTOM } = Astal.WindowAnchor
    return <window
        className="WorkspacesWindow"
        gdkmonitor={gdkmonitor}
        anchor={TOP | LEFT | BOTTOM}
        layer={Astal.Layer.BACKGROUND}
        application={App}
    >
        <box valign={Gtk.Align.CENTER}>
            <Workspaces />
        </box>
    </window>
}
