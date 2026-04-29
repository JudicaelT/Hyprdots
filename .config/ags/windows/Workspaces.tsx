import app from "ags/gtk4/app"
import { Astal, Gdk, Gtk } from "ags/gtk4"
import WorkspacesWidget from "../widgets/workspaces/Workspaces"

export default function Workspaces({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }) {
    const { TOP, LEFT, BOTTOM } = Astal.WindowAnchor
    return <window
        class="WorkspacesWindow"
        visible
        anchor={TOP | LEFT | BOTTOM}
        layer={Astal.Layer.BOTTOM}
        gdkmonitor={gdkmonitor}
        application={app}
    >
        <box valign={Gtk.Align.CENTER}>
            <WorkspacesWidget />
        </box>
    </window>
}
