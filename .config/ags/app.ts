import { App } from "astal/gtk3"
import style from "./style.scss"
import Bar from "./windows/Bar"
import RightSide from "./windows/RightSide"
import Panel from "./widgets/bar/Panel"

App.start({
    css: style,
    main() {
        App.get_monitors().map(Panel)
        App.get_monitors().map(Bar)
        App.get_monitors().map(RightSide)
    },
})
