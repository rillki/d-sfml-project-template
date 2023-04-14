module app;

import std.stdio: writeln;
import std.string: toStringz;

import bindbc.sfml;

void main() {
    // window dimensions
    enum width = 720;
    enum height = 480;
    enum title = "D/SFML project";

    // create window
    auto window = sfWindow_create(sfVideoMode(width, height), title.toStringz, sfWindowStyle.sfDefaultStyle, null);
    scope(exit) { sfWindow_destroy(window); }

    while(sfWindow_isOpen(window)) {
        // process events
        sfEvent event;
        while(sfWindow_pollEvent(window, &event)) {
            if(event.type == sfEventType.sfEvtClosed) {
                sfWindow_close(window);
            }
        }

        // update
        // ...

        // render
        // ...
    }
}
