import app from "ags/gtk4/app"
import { Astal, Gdk } from "ags/gtk4"
import Time from "../widgets/time/Time"

export default function RightSide({ gdkmonitor }: { gdkmonitor: Gdk.Monitor }) {
    const { TOP, RIGHT } = Astal.WindowAnchor
    return <window
        class="RightSideWindow"
        visible
        anchor={TOP | RIGHT}
        layer={Astal.Layer.BOTTOM}
        exclusivity={Astal.Exclusivity.IGNORE}
        gdkmonitor={gdkmonitor}
        application={app}
    >
        <Time />
    </window>
}
