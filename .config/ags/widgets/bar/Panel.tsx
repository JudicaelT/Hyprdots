import { Variable } from "astal"
import { App, Astal, Gdk } from "astal/gtk3"

let isVisible: Variable<boolean> = Variable(false);

export default function Panel(gdkmonitor: Gdk.Monitor) {
    const { LEFT, TOP, BOTTOM } = Astal.WindowAnchor
    return <window
        className="PanelWindow"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.IGNORE}
        anchor={LEFT | TOP | BOTTOM}
        application={App}
        visible={isVisible.get()}
        widthRequest={500}
    >
        <box className="Panel">
            My menu
        </box>
    </window>
}

export function togglePanel() {
    isVisible.set(!isVisible.get())
    console.log(isVisible)
}
