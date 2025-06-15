import { App, Astal, Gdk } from "astal/gtk3"
import { Variable } from "astal"

export default function SysMonitor(gdkmonitor: Gdk.Monitor) {
    const { RIGHT, BOTTOM } = Astal.WindowAnchor
    return <window
        className="SysMonitorWindow"
        gdkmonitor={gdkmonitor}
        anchor={RIGHT | BOTTOM}
        layer={Astal.Layer.BACKGROUND}
        exclusivity={Astal.Exclusivity.IGNORE}
        application={App}
    >
        <box vertical>
            <centerbox vertical className="SysMonitor">
                <MemoryUsage />
                <CpuUsage />
            </centerbox>
        </box>
    </window>
}

function MemoryUsage() {
    const memoryUsage = Variable("").poll(
        3000,
        ["bash", "-c", "free | grep Mem | awk '{printf \"%.2f\", $3/$2}'"],
    )
    const memoryUsagePercentage = Variable("").poll(
        3000,
        ["bash", "-c", "free | grep Mem | awk '{printf \"%.0f\", ($3/$2)*100}'"],
    )
    return <box>
        <circularprogress value={memoryUsage()} startAt={-0.25} endAt={0.75}>
            <box vertical halign="center" valign="center">
                <label>RAM</label>
                <label>{memoryUsagePercentage()}</label>
            </box>
        </circularprogress>
    </box>
}

function CpuUsage() {
    const cpuUsage = Variable("").poll(
        3000,
        ["bash", "-c", "vmstat 1 2 | tail -1 | awk '{printf \"%.2f\", (100 - $15)/100}'"],
    )
    const cpuUsagePercentage = Variable("").poll(
        3000,
        ["bash", "-c", "vmstat 1 2 | tail -1 | awk '{printf \"%.0f\", (100 - $15)}'"],
    )
    return <box>
        <circularprogress value={cpuUsage()} startAt={-0.25} endAt={0.75}>
            <box vertical halign="center" valign="center">
                <label>CPU</label>
                <label>{cpuUsagePercentage()}</label>
            </box>
        </circularprogress>
    </box>
}
