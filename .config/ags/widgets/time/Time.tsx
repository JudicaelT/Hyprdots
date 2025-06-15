import { App, Astal, Gdk } from "astal/gtk3"
import { Variable } from "astal"

export default function Time(gdkmonitor: Gdk.Monitor) {
    const time: Variable<string> = Variable("").poll(1000, "date +\"%H:%M\"")
    const date: Variable<string> = Variable("").poll(1000, "date +\"- %d %B %Y -\"")
    return <window
        className="TimeWindow"
        gdkmonitor={gdkmonitor}
        anchor={Astal.WindowAnchor.TOP}
        layer={Astal.Layer.BACKGROUND}
        exclusivity={Astal.Exclusivity.IGNORE}
        application={App}
    >
        <centerbox vertical>
            <label className="time">{time()}</label>
            <label className="date">{date()}</label>
        </centerbox>
    </window>
}
