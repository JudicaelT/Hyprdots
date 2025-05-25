import { Variable } from "astal"
import { App, Astal, Gdk } from "astal/gtk3"

let isPanelVisible: Variable<boolean> = Variable(false);

export default function Panel(gdkmonitor: Gdk.Monitor) {
    const { LEFT, TOP, BOTTOM } = Astal.WindowAnchor
    return <window
        className="PanelWindow"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.IGNORE}
        anchor={LEFT | TOP | BOTTOM}
        application={App}
        visible={isPanelVisible.get()}
        widthRequest={500}
    >
        <box className="Panel">
            My menu
        </box>
    </window>
}

export function togglePanel() {
    isPanelVisible.set(!isPanelVisible.get())
    console.log(isPanelVisible)
}
