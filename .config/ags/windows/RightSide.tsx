import { App, Astal, Gdk } from "astal/gtk3"
import Time from "../widgets/time/Time"

export default function RightSide(gdkmonitor: Gdk.Monitor) {
    const { TOP, RIGHT } = Astal.WindowAnchor
    return <window
        className="RightSideWindow"
        gdkmonitor={gdkmonitor}
        anchor={TOP | RIGHT}
        layer={Astal.Layer.BACKGROUND}
        exclusivity={Astal.Exclusivity.IGNORE}
        application={App}
    >
        <box>
            <Time />
        </box>
    </window>
}
