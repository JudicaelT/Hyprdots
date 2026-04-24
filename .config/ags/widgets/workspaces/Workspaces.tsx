import { bind } from "astal"
import Hyprland from "gi://AstalHyprland"

export default function Workspaces() {
    const hypr = Hyprland.get_default()
    return <box vertical className="Workspaces">
        {bind(hypr, "workspaces").as(workspaces =>
            workspaces
                .filter(workspace => !(isSpecialWorkspace(workspace)))
                .sort((a, b) => a.id - b.id)
                .map(workspace => (
                    <button
                        cursor="pointer"
                        label={workspaceIcon(workspace)}
                        className={
                            bind(hypr, "focusedWorkspace").as(focused => {
                                let className: string = ""
                                if (workspace === focused) className += " focused"
                                if (workspace.get_clients().length == 0) className += " empty"
                                return className
                            })
                        }
                        onClicked={() => workspace.focus()}
                    />
                ))
        )}
    </box>
}

function isSpecialWorkspace(workspace: Hyprland.Workspace): boolean {
    return workspace.id >= -99 && workspace.id <= -2
}

function workspaceIcon(workspace: Hyprland.Workspace): string {
    switch (workspace.id) {
        case 1: return "";
        case 2: return "";
        case 3: return "";
        case 4: return "";
        default: return "";
    }
}
