import { Gdk, Gtk } from "ags/gtk4"
import { For, Accessor, createBinding } from "ags"
import Hyprland from "gi://AstalHyprland"

const cursorPointer = Gdk.Cursor.new_from_name("pointer", null);

export default function Workspaces() {
    const hypr = Hyprland.get_default()
    const workspaces = createBinding(hypr, "workspaces").as(filterAndSortWorkspaces)
    const focusedWorkspace = createBinding(hypr, "focusedWorkspace")
    return <box orientation={Gtk.Orientation.VERTICAL} class="Workspaces">
        <For each={workspaces}>
            {(workspace) => {
                return <button
                    cursor={cursorPointer}
                    label={workspaceIcon(workspace)}
                    class={focusedWorkspace((f) => (workspace === f ? "focused" : ""))}
                    onClicked={() => workspace.focus()}
                />
            }}
        </For>
    </box>
}

function filterAndSortWorkspaces(workspaces: Hyprland.Workspace[]): Hyprland.Workspace[] {
    return workspaces
        .filter(workspace => !(isSpecialWorkspace(workspace)))
        .sort((a, b) => a.id - b.id)
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
