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
    auto window = sfRenderWindow_create(sfVideoMode(width, height), title.toStringz, sfWindowStyle.sfDefaultStyle, null);
    scope(exit) { sfRenderWindow_destroy(window); }

    // configure window
    sfRenderWindow_setFramerateLimit(window, 30);
    sfRenderWindow_setVerticalSyncEnabled(window, true);

    // load texture
    auto texture = sfTexture_createFromFile("imgs/d-sfml.jpg", null);
    scope(exit) { sfTexture_destroy(texture); }

    // create sprite
    auto sprite = sfSprite_create();
    scope(exit) { sfSprite_destroy(sprite); }
    sfSprite_setTexture(sprite, texture, sfTrue);

    while(sfRenderWindow_isOpen(window)) {
        // process events
        sfEvent event;
        while(sfRenderWindow_pollEvent(window, &event)) {
            switch(event.type) with(sfEvent) {
                case sfEvtClosed:
                    sfRenderWindow_close(window);
                    break;
                case sfEvtKeyPressed:
                    if(event.key.code == sfKeyCode.sfKeyEscape) {
                        sfRenderWindow_close(window);
                    }
                    break;
                default: 
                    break;
            }
        }

        // update
        // ...

        // render
        sfRenderWindow_clear(window, sfColor_fromRGBA(0, 0, 0, 0));
        scope(exit) { sfRenderWindow_display(window); }
        
        sfRenderWindow_drawSprite(window, sprite, null);
    }
}
