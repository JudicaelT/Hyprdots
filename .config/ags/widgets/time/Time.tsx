import { Variable } from "astal"

export default function Time() {
    const time: Variable<string> = Variable("").poll(1000, "date +\"%H:%M\"")
    const date: Variable<string> = Variable("").poll(1000, "date +\"󱌃  %d %B %Y 󱌃\"")
    return <centerbox vertical className="Time">
        <label className="time">{time()}</label>
        <label className="date">{date()}</label>
    </centerbox>
}
