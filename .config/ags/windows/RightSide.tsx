import { App, Astal, Gdk } from "astal/gtk3"
import Time from "../widgets/time/Time"
import SysMonitor from "../widgets/sys_monitor/SysMonitor"

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
        <box vertical>
            <Time />
            <SysMonitor />
        </box>
    </window>
}
