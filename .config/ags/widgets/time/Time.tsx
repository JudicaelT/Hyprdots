import { Gtk } from "ags/gtk4"
import { createPoll } from "ags/time";

export default function Time() {
    const time = createPoll("", 1000, "date +\"%H %M\"")
    const date = createPoll("", 1000, "date +\"%d %B %Y\"")
    return <box class="Time" orientation={Gtk.Orientation.VERTICAL} >
        <label class="time" label={time((t) => `${t}`)} />
        <label class="date" label={date((d) => `${d}`)} />
    </box>
}
