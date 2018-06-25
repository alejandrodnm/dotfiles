I know there are much better ways, but this was the easiest. I did it by
editing /usr/share/X11/xkb/symbols/pc and adding key <RALT> { [ Return ] }; as
the last instruction of xkb_symbols "pc105"

default partial alphanumerickeys modifierkeys

```
xkb_symbols "pc105" {

    key <ESC>  {        [ Escape                ]       };

    // The extra key on many European keyboards:
    key <LSGT> {        [ less, greater, bar, brokenbar ] };

    // The following keys are common to all layouts.
    key <BKSL> {        [ backslash,    bar     ]       };
    key <SPCE> {        [        space          ]       };

    include "srvr_ctrl(fkey2vt)"
    include "pc(editing)"
    include "keypad(x11)"

    key <BKSP> {        [ BackSpace, BackSpace  ]       };

    key  <TAB> {        [ Tab,  ISO_Left_Tab    ]       };
    key <RTRN> {        [ Return                ]       };

    key <CAPS> {        [ Caps_Lock             ]       };
    key <NMLK> {        [ Num_Lock              ]       };

    key <LFSH> {        [ Shift_L               ]       };
    key <LCTL> {        [ Control_L             ]       };
    key <LWIN> {        [ Super_L               ]       };

    key <RTSH> {        [ Shift_R               ]       };
    key <RCTL> {        [ Control_R             ]       };
    key <RWIN> {        [ Super_R               ]       };
    key <MENU> {        [ Menu                  ]       };

    // Beginning of modifier mappings.
    modifier_map Shift  { Shift_L, Shift_R };
    modifier_map Lock   { Caps_Lock };
    modifier_map Control{ Control_L, Control_R };
    modifier_map Mod2   { Num_Lock };
    modifier_map Mod4   { Super_L, Super_R };

    // Fake keys for virtual<->real modifiers mapping:
    key <LVL3> {        [ ISO_Level3_Shift      ]       };
    key <MDSW> {        [ Mode_switch           ]       };
    modifier_map Mod5   { <LVL3>, <MDSW> };

    key <ALT>  {        [ NoSymbol, Alt_L       ]       };
    include "altwin(meta_alt)"

    key <META> {        [ NoSymbol, Meta_L      ]       };
    modifier_map Mod1   { <META> };

    key <SUPR> {        [ NoSymbol, Super_L     ]       };
    modifier_map Mod4   { <SUPR> };

    key <HYPR> {        [ NoSymbol, Hyper_L     ]       };
    modifier_map Mod4   { <HYPR> };
    // End of modifier mappings.

    key <OUTP> { [ XF86Display ] };
    key <KITG> { [ XF86KbdLightOnOff ] };
    key <KIDN> { [ XF86KbdBrightnessDown ] };
    key <KIUP> { [ XF86KbdBrightnessUp ] };
    key <RALT> { [ Return ] };
};
```