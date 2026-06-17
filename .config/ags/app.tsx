import app from "ags/gtk4/app"
import style from "./style.scss"
import Bar from "./windows/Bar"
import Workspaces from "./windows/Workspaces"
import RightSide from "./windows/RightSide"
import { createBinding, For, This } from "ags"

app.start({
    css: style,
    gtkTheme: "Adwaita",
    main() {
        const monitors = createBinding(app, "monitors")
        return (
            <For each={monitors}>
                {(monitor) => (
                    <This this={app}>
                        <Bar gdkmonitor={monitor} />
                        <RightSide gdkmonitor={monitor} />
                        <Workspaces gdkmonitor={monitor} />
                    </This>
                )}
            </For>
        )
    },
})
