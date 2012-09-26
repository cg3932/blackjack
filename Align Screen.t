%This imports the GUI's that will be used throughout the entire game
import GUI in "%oot/lib/GUI"

%Setting the initial window parameters
var WindowID : int := Window.Open ("graphics:788;530;nobuttonbar;nocursor")

%LINES
drawline (0, 450, maxx, 450, brightred)
drawline (0, 90, maxx, 90, brightred)

var Panel_Colour_For_Blackjack := red

%Draw The Centre Information Box
drawfillbox (200, 320, maxx - 200, 370, Panel_Colour_For_Blackjack)
drawfillarc (200, 345, 25, 25, 90, 270, Panel_Colour_For_Blackjack)
drawfillarc (maxx - 200, 345, 25, 25, 270, 90, Panel_Colour_For_Blackjack)

%Outline The Box
drawline (200, 370, maxx - 200, 370, black)
drawline (200, 320, maxx - 200, 320, black)
drawarc (200, 345, 25, 25, 90, 270, black)
drawarc (maxx - 200, 345, 25, 25, 270, 90, black)


