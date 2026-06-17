import app from "ags/gtk4/app"
import { Astal, Gdk } from "ags/gtk4"
import BarWidget from "../widgets/bar/Bar"

export default function Bar({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }) {
    const { LEFT, BOTTOM, RIGHT } = Astal.WindowAnchor
    return <window
        class="BarWindow"
        visible
        anchor={LEFT | BOTTOM | RIGHT}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        application={app}
    >
        <BarWidget />
    </window>

}
