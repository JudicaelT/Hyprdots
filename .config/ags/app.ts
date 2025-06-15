import { App } from "astal/gtk3"
import style from "./style.scss"
import Bar from "./widgets/bar/Bar"
import Panel from "./widgets/bar/Panel"
import Time from "./widgets/time/Time"
import SysMonitor from "./widgets/sys_monitor/SysMonitor"

App.start({
    css: style,
    main() {
        App.get_monitors().map(Panel)
        App.get_monitors().map(Bar)
        App.get_monitors().map(Time)
        App.get_monitors().map(SysMonitor)
    },
})
