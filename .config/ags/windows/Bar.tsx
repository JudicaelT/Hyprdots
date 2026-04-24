import { App, Astal, Gdk } from "astal/gtk3"
import BarWidget from "../widgets/bar/Bar"

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { LEFT, BOTTOM, RIGHT } = Astal.WindowAnchor
    return <window
        className="BarWindow"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={LEFT | BOTTOM | RIGHT}
        application={App}
    >
        <BarWidget />
    </window>
}
