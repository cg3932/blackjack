import GUI in "%oot/lib/GUI"

View.Set ("graphics:max;max,nobuttonbar")


var Font_Title, Font_Opening_Buttons, Font_Bottom_Selection, Font_Music_Buttons, Font_Title_Background_Music : int
var newWidth, newHeight : int
var Button_GUI_Bottom_Return_Background_Music, Button_GUI_Bottom_Play_Background_Music, Button_GUI_Bottom_Quit_Background_Music : int
var Button_GUI_Track_1, Button_GUI_Track_2, Button_GUI_Track_3, Button_GUI_Track_4 : int
var Button_GUI_Track_5, Button_GUI_Track_6, Font_Waiting_Opening, Font_Title_Introduction : int
var Name_Of_Player : string

var Monitor_Background_Music := 0

Font_Title := Font.New ("Times New Roman Bold:25")
Font_Opening_Buttons := Font.New ("Times New Roman Bold:23")
Font_Bottom_Selection := Font.New ("Times New Roman Bold:18")
Font_Music_Buttons := Font.New ("Times New Roman Bold:22")
Font_Title_Background_Music := Font.New ("Times New Roman Bold:23")
Font_Waiting_Opening := Font.New ("Times New Roman Bold:15")
Font_Title_Introduction := Font.New ("Times New Roman Bold:30")


%Store_Cards
var Card_Names : array 1 .. 52 of int
for Set_Cards : 1 .. 52
    Card_Names (Set_Cards) := Pic.FileNew ("Card_" + intstr (Set_Cards) + ".bmp")
    Pic.SetTransparentColor (Card_Names (Set_Cards), brightred)
end for




%These are the variables for the Main panel GUI's for this game
var Panel_Colour_For_Blackjack, Panel_Writing_For_Black_Jack, Background_Colour_Blackjack : int
var GUI_Change_Bet_Blackjack, GUI_Hit_Blackjack, GUI_Stand_Blackjack, GUI_Get_Hint_Blackjack : int
var GUI_Animate_Change_Bet_Blackjack, GUI_Animate_Hint_Blackjack : int
var GUI_Total_Dealer_Blackjack, GUI_Total_Player_Blackjack : int
var GUI_Total_Top_Dealer_Blackjack, GUI_Total_Top_Player_Blackjack : int
var GUI_Total_Bottom_Dealer_Blackjack, GUI_Total_Bottom_Player_Blackjack : int

%This is the variable to monitor the GUI's used in this game
var Monitor_GUI_Top_Panel_Blackjack := 0

%These are the variables for the bet of the person and the randomly chosen card for the dealer
var Change_The_Bet, Random_Card_Choose_Dealer_Blackjack : int

%These are the varibales for the fonts in this game
var Font_For_Total_Display_Blackjack, Font_For_Centre_Display_Blackjack : int
Font_For_Total_Display_Blackjack := Font.New ("Times New Roman Bold:35")
Font_For_Centre_Display_Blackjack := Font.New ("Times New Roman Bold:17")

%These variables will be used for randomly choosing and drawing the cards
var Random_Card_Choose_Blackjack, X_Location_For_Card_Being_Drawn, Y_Location_For_Card_Being_Drawn : int

%These are some integer values used for the scoring in the game
var Count_Player_Card_Draw_Loop_Blackjack := 0
var Count_Dealer_Card_Draw_Loop_Blackjack := 0
var The_Player_Is_Drawing := 0
var The_Dealer_Is_Drawing := 0
var Count_Game_Number_Blackjack := 1
var Count_Round_Number_Blackjack := 1
var Current_Bet_Of_Player_Blackjack := 500
var Current_Principal_Of_Player_Blackjack := 0
var Finish_Drawing_Cards := 0

%This variable is used for the back panel
var Back_Panel_Identification : string

%These variable are used to add the score of the player and dealer
var Players_Sum_Score_Blackjack, Dealers_Sum_Score_Blackjack, Value_Of_Card_Drawn_Blackjack : int

%These are the variables to display the numerical values of the game onto the screen usinf fonts
var Text_Time_Blackjack, String_Time_Blackjack, Text_Current_Bet_Blackjack, String_Current_Bet_Blackjack : string
var Text_Current_Principal_Blackjack, String_Current_Principal_Blackjack, Text_Game_Number_Blackjack : string
var String_Game_Number_Blackjack, Text_Round_Number_Blackjack, String_Round_Number_Blackjack : string
var Text_Player_Sum_Blackjack, String_Player_Sum_Blackjack, Text_Dealers_Sum_Blackjack : string
var String_Dealers_Sum_Blackjack : string
var Time_Monitor_For_Blackjack := 0

%This is the conditional exits for the game loop
var Condition_Exit_Principle_Blackjack := 0
var Condition_Win_Game_Blackjack := 0
var Condition_Time_Limit_Blackjack := 0

%These variables will be used to determine the x coordinates of the cards for the
%player and the dealer
var Location_X_Players_Sum_Blackjack, Location_X_Dealers_Sum_Blackjack : string
var Location_X_Name_Blackjack : int


Panel_Colour_For_Blackjack := brightred
Panel_Writing_For_Black_Jack := black
Background_Colour_Blackjack := green
Back_Panel_Identification := "Back_Panel_Classic.bmp"
Name_Of_Player := "Christian"

%This procedure decides the verdict of the game
procedure Verdict_Of_The_Game_Blackjack
    Time_Monitor_For_Blackjack := 1
    Monitor_GUI_Top_Panel_Blackjack := 1
    %This disables the players gui's to prevent an error
    GUI.Disable (GUI_Change_Bet_Blackjack)
    GUI.Disable (GUI_Get_Hint_Blackjack)
    GUI.Disable (GUI_Stand_Blackjack)
    GUI.Disable (GUI_Hit_Blackjack)
    delay (200)

    %This determines the outcome of the game and which procedures to call upon
    if Current_Principal_Of_Player_Blackjack >= 10000 then
	Draw.Text ("You've Won The Game!", 245, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)
	% open : File_Check_Score, "Player_Inputed_Score.dat", put
	% put : File_Check_Score, Name_Of_Player, Score_Count_Pacman, Text_Time_Pacman
	% close : File_Check_Score

	delay (2000)
	cls

	%You_Have_Won_Animation_Blackjack
	%Winning_Video_Game_Completed
	%You_Have_Won_Mission_6
    elsif Current_Principal_Of_Player_Blackjack < 0 then
	drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	Draw.Text ("Sorry, Your Principle Went Below '0'", 210, 348, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)
	Draw.Text ("You Lose!", 340, 328, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)

	delay (2000)
	cls
	%Animation_You_Have_Lost_The_Game
    elsif Condition_Time_Limit_Blackjack = 1 then
	if Text_Time_Blackjack = "0" then
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	    Draw.Text ("Sorry, You Ran Out Of Time", 250, 348, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)
	    Draw.Text ("You Lose!", 340, 328, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)

	    delay (2000)
	    cls
	    %Animation_You_Have_Lost_The_Game
	end if
    end if

    %put "Your_Score Is ", Text_Time_Blackjack
    %put "Your Time Was ", Text_Time_Blackjack
end Verdict_Of_The_Game_Blackjack


procedure Set_Initial_Parameters
    Panel_Colour_For_Blackjack := red
    Panel_Writing_For_Black_Jack := white
    Back_Panel_Identification := "Back_Panel_Classic.bmp"
    Background_Colour_Blackjack := green
end Set_Initial_Parameters





%This is the time counting process for this game
process Time_Count_Blackjack
    for c : 0 .. 100000
	String_Time_Blackjack := intstr (c, 1)
	Text_Time_Blackjack := String_Time_Blackjack
	drawfillbox (37, 13, 103, 39, white)
	drawfillarc (36, 26, 14, 14, 90, 270, white)
	drawfillarc (104, 26, 14, 14, 270, 90, white)
	Draw.Text (Text_Time_Blackjack, 37, 20, Font_Waiting_Opening, black)
	Draw.Text ("Sec", 72, 20, Font_Waiting_Opening, black)
	delay (1000)
	exit when Time_Monitor_For_Blackjack = 1
    end for

    %This tells the program that the time has ended for the player
    Condition_Time_Limit_Blackjack := 1
end Time_Count_Blackjack

%This procedure is what draws the layout for the blackjack game
procedure Draw_Bottom_Panel_For_Blackjack
    %Fill In The Background COlour
    colourback (Background_Colour_Blackjack)
    cls
    colourback (white)

    %Fill In The Box
    drawfillbox (0, 0, maxx, 75, Panel_Colour_For_Blackjack)

    %Top Line
    drawline (0, 75, maxx, 75, black)

    %Middle Box
    %Lines
    drawline (maxx div 2 - 109, 10, maxx div 2 + 109, 10, black)
    drawline (maxx div 2 - 109, 42, maxx div 2 + 109, 42, black)
    %Left Arc
    drawarc (maxx div 2 - 109, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (maxx div 2 + 109, 26, 16, 16, 270, 90, black)

    %Far Left Box
    %Lines
    drawline (36, 10, 104, 10, black)
    drawline (36, 42, 104, 42, black)
    %Left Arc
    drawarc (36, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (104, 26, 16, 16, 270, 90, black)

    %Left Box
    %Lines
    drawline (160, 10, 228, 10, black)
    drawline (160, 42, 228, 42, black)
    %Left Arc
    drawarc (160, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (228, 26, 16, 16, 270, 90, black)

    %Right Box
    %Lines
    drawline (557, 10, 625, 10, black)
    drawline (557, 42, 625, 42, black)
    %Left Arc
    drawarc (557, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (625, 26, 16, 16, 270, 90, black)

    %Far Right Box
    %Lines
    drawline (681, 10, 749, 10, black)
    drawline (681, 42, 749, 42, black)
    %Left Arc
    drawarc (681, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (749, 26, 16, 16, 270, 90, black)

    %Filling In The Bottom Boxes
    %Middle Box
    drawfillbox (maxx div 2 - 109, 11, maxx div 2 + 109, 41, white)
    drawfillarc (maxx div 2 - 109, 26, 15, 15, 90, 270, white)
    drawfillarc (maxx div 2 + 109, 26, 15, 15, 270, 90, white)

    %Far Left Box
    drawfillbox (37, 11, 104, 41, white)
    drawfillarc (36, 26, 15, 15, 90, 270, white)
    drawfillarc (104, 26, 15, 15, 270, 90, white)

    %Left Box
    drawfillbox (160, 11, 228, 41, white)
    drawfillarc (160, 26, 15, 15, 90, 270, white)
    drawfillarc (228, 26, 15, 15, 270, 90, white)

    %Right Box
    drawfillbox (557, 11, 625, 41, white)
    drawfillarc (557, 26, 15, 15, 90, 270, white)
    drawfillarc (625, 26, 15, 15, 270, 90, white)

    %Far Right Box
    drawfillbox (681, 11, 749, 41, white)
    drawfillarc (681, 26, 15, 15, 90, 270, white)
    drawfillarc (749, 26, 15, 15, 270, 90, white)

    %Text For The Bottom Boxes
    Draw.Text ("Time", 50, 53, Font_Waiting_Opening, Panel_Writing_For_Black_Jack)
    Draw.Text ("Current Bet", 146, 53, Font_Waiting_Opening, Panel_Writing_For_Black_Jack)
    Draw.Text ("Current Principal", 320, 53, Font_Waiting_Opening, Panel_Writing_For_Black_Jack)
    Draw.Text ("Game", 567, 53, Font_Waiting_Opening, Panel_Writing_For_Black_Jack)
    Draw.Text ("Round", 687, 53, Font_Waiting_Opening, Panel_Writing_For_Black_Jack)

    %In The Box Writing
    Draw.Text ("Sec", 72, 20, Font_Waiting_Opening, black)
    Draw.Text ("$", 165, 20, Font_Waiting_Opening, black)
    Draw.Text ("$", 350, 20, Font_Waiting_Opening, black)

    %Top Panel
    drawline (100, 120, maxx - 100, 120, black)
    %Left Arcs
    drawarc (80, 75, 25, 25, 90, 180, black)
    drawarc (100, 98, 22, 22, 90, 180, black)
    %Right Arcs
    drawarc (710, 75, 25, 25, 0, 90, black)
    drawarc (688, 99, 21, 21, 0, 90, black)

    %Fill in the top panel
    drawfillbox (101, 119, maxx - 100, 76, Panel_Colour_For_Blackjack)
    drawfillarc (80, 76, 24, 23, 90, 180, Panel_Colour_For_Blackjack)
    drawfillarc (100, 98, 21, 21, 90, 180, Panel_Colour_For_Blackjack)
    drawfillarc (710, 76, 24, 23, 0, 90, Panel_Colour_For_Blackjack)
    drawfillarc (688, 99, 20, 20, 0, 90, Panel_Colour_For_Blackjack)
    drawfillbox (80, 76, 100, 100, Panel_Colour_For_Blackjack)
    drawfillbox (680, 76, 709, 98, Panel_Colour_For_Blackjack)

    %Draw The Centre Information Box
    drawfillbox (200, 320, maxx - 200, 370, Panel_Colour_For_Blackjack)
    drawfillarc (200, 345, 25, 25, 90, 270, Panel_Colour_For_Blackjack)
    drawfillarc (maxx - 200, 345, 25, 25, 270, 90, Panel_Colour_For_Blackjack)

    %Outline The Box
    drawline (200, 370, maxx - 200, 370, black)
    drawline (200, 320, maxx - 200, 320, black)
    drawarc (200, 345, 25, 25, 90, 270, black)
    drawarc (maxx - 200, 345, 25, 25, 270, 90, black)

    %Tells the player that it is his or her turn to play
    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)
    Draw.Text ("It Is Your Turn To Play", 246, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)

    drawfillbox (558, 13, 624, 39, white)
    drawfillarc (559, 26, 14, 14, 90, 270, white)
    drawfillarc (623, 26, 14, 14, 270, 90, white)
    %This displays the game number for the game
    String_Game_Number_Blackjack := intstr (Count_Game_Number_Blackjack, 1)
    Text_Game_Number_Blackjack := String_Game_Number_Blackjack
    Draw.Text (Text_Game_Number_Blackjack, 585, 20, Font_Waiting_Opening, black)

    drawfillbox (120, 121, 251, 160, Background_Colour_Blackjack)
    drawfillbox (161, 13, 227, 39, white)
    drawfillarc (162, 26, 14, 14, 90, 270, white)
    drawfillarc (226, 26, 14, 14, 270, 90, white)
    Draw.Text ("$", 165, 20, Font_Waiting_Opening, black)

    %This displays the current bet of the player
    String_Current_Bet_Blackjack := intstr (Current_Bet_Of_Player_Blackjack, 1)
    Text_Current_Bet_Blackjack := String_Current_Bet_Blackjack
    Draw.Text (Text_Current_Bet_Blackjack, 180, 20, Font_Waiting_Opening, black)

    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)
    Draw.Text ("$", 350, 20, Font_Waiting_Opening, black)
    %This displays the current principal of the player
    String_Current_Principal_Blackjack := intstr (Current_Principal_Of_Player_Blackjack, 1)
    Text_Current_Principal_Blackjack := String_Current_Principal_Blackjack
    Draw.Text (Text_Current_Principal_Blackjack, 365, 20, Font_Waiting_Opening, black)

    drawfillbox (682, 13, 748, 39, white)
    drawfillarc (683, 26, 14, 14, 90, 270, white)
    drawfillarc (747, 26, 14, 14, 270, 90, white)

    %This displays the round number for the game
    String_Round_Number_Blackjack := intstr (Count_Round_Number_Blackjack, 1)
    Text_Round_Number_Blackjack := String_Round_Number_Blackjack
    Draw.Text (Text_Round_Number_Blackjack, 708, 20, Font_Waiting_Opening, black)

    %This displays the time
    Draw.Text (Text_Time_Blackjack, 37, 20, Font_Waiting_Opening, black)
end Draw_Bottom_Panel_For_Blackjack

%This procedure draws a card from the deck and displays it on the screen
procedure Draw_A_Card_From_Deck_Blackjack
    %This randomly chooses a number between 1 and 52
    if The_Player_Is_Drawing = 1 then
	randint (Random_Card_Choose_Blackjack, 1, 52)
    elsif The_Dealer_Is_Drawing = 1 then
	Random_Card_Choose_Blackjack := Random_Card_Choose_Dealer_Blackjack
    end if

    %This locates the drawing of the card depending on the card number of which it is being drawn
    if The_Player_Is_Drawing = 1 then
	Y_Location_For_Card_Being_Drawn := 175
	if Count_Player_Card_Draw_Loop_Blackjack = 1 then
	    X_Location_For_Card_Being_Drawn := 382
	elsif Count_Player_Card_Draw_Loop_Blackjack = 2 then
	    X_Location_For_Card_Being_Drawn := 425
	elsif Count_Player_Card_Draw_Loop_Blackjack = 3 then
	    X_Location_For_Card_Being_Drawn := 468
	elsif Count_Player_Card_Draw_Loop_Blackjack = 4 then
	    X_Location_For_Card_Being_Drawn := 511
	elsif Count_Player_Card_Draw_Loop_Blackjack = 5 then
	    X_Location_For_Card_Being_Drawn := 554
	elsif Count_Player_Card_Draw_Loop_Blackjack = 6 then
	    X_Location_For_Card_Being_Drawn := 597
	end if

    elsif The_Dealer_Is_Drawing = 1 then
	Y_Location_For_Card_Being_Drawn := 385
	if Count_Dealer_Card_Draw_Loop_Blackjack = 1 then
	    X_Location_For_Card_Being_Drawn := 382
	elsif Count_Dealer_Card_Draw_Loop_Blackjack = 2 then
	    X_Location_For_Card_Being_Drawn := 425
	elsif Count_Dealer_Card_Draw_Loop_Blackjack = 3 then
	    X_Location_For_Card_Being_Drawn := 468
	elsif Count_Dealer_Card_Draw_Loop_Blackjack = 4 then
	    X_Location_For_Card_Being_Drawn := 511
	elsif Count_Dealer_Card_Draw_Loop_Blackjack = 5 then
	    X_Location_For_Card_Being_Drawn := 554
	elsif Count_Dealer_Card_Draw_Loop_Blackjack = 6 then
	    X_Location_For_Card_Being_Drawn := 597
	end if
    end if

    Pic.Draw (Card_Names (Random_Card_Choose_Blackjack), X_Location_For_Card_Being_Drawn, Y_Location_For_Card_Being_Drawn, picMerge)

    if Random_Card_Choose_Blackjack <= 4 then
	Value_Of_Card_Drawn_Blackjack := 2
    elsif Random_Card_Choose_Blackjack <= 8 then
	Value_Of_Card_Drawn_Blackjack := 3
    elsif Random_Card_Choose_Blackjack <= 12 then
	Value_Of_Card_Drawn_Blackjack := 4
    elsif Random_Card_Choose_Blackjack <= 16 then
	Value_Of_Card_Drawn_Blackjack := 5
    elsif Random_Card_Choose_Blackjack <= 20 then
	Value_Of_Card_Drawn_Blackjack := 6
    elsif Random_Card_Choose_Blackjack <= 24 then
	Value_Of_Card_Drawn_Blackjack := 7
    elsif Random_Card_Choose_Blackjack <= 28 then
	Value_Of_Card_Drawn_Blackjack := 8
    elsif Random_Card_Choose_Blackjack <= 32 then
	Value_Of_Card_Drawn_Blackjack := 9
    elsif Random_Card_Choose_Blackjack <= 44 then
	Value_Of_Card_Drawn_Blackjack := 10
    elsif Random_Card_Choose_Blackjack <= 48 then
	Value_Of_Card_Drawn_Blackjack := 10

    else
	%Automated value for the aces (1 or 11)
	if The_Player_Is_Drawing = 1 then
	    if Players_Sum_Score_Blackjack + 11 <= 21 then
		Value_Of_Card_Drawn_Blackjack := 11
	    elsif Players_Sum_Score_Blackjack + 11 >= 22 then
		Value_Of_Card_Drawn_Blackjack := 1
	    end if
	elsif The_Dealer_Is_Drawing = 1 then
	    if Dealers_Sum_Score_Blackjack + 11 <= 21 then
		Value_Of_Card_Drawn_Blackjack := 11
	    elsif Dealers_Sum_Score_Blackjack + 11 >= 22 then
		Value_Of_Card_Drawn_Blackjack := 1
	    end if
	end if
    end if

    %This adds the value of the drawn card to the value that the player already has
    if The_Player_Is_Drawing = 1 then
	Players_Sum_Score_Blackjack := Players_Sum_Score_Blackjack + Value_Of_Card_Drawn_Blackjack

	drawfillbox (130, 210, 225, 265, grey)

	%This displays the players score
	String_Player_Sum_Blackjack := intstr (Players_Sum_Score_Blackjack, 1)
	Text_Player_Sum_Blackjack := String_Player_Sum_Blackjack
	Draw.Text (Text_Player_Sum_Blackjack, 155, 224, Font_For_Total_Display_Blackjack, black)
    elsif The_Dealer_Is_Drawing = 1 then
	Dealers_Sum_Score_Blackjack := Dealers_Sum_Score_Blackjack + Value_Of_Card_Drawn_Blackjack

	drawfillbox (130, 420, 225, 476, grey)

	%This displays the dealers score
	String_Dealers_Sum_Blackjack := intstr (Dealers_Sum_Score_Blackjack, 1)
	Text_Dealers_Sum_Blackjack := String_Dealers_Sum_Blackjack
	Draw.Text (Text_Dealers_Sum_Blackjack, 155, 434, Font_For_Total_Display_Blackjack, black)
    end if
end Draw_A_Card_From_Deck_Blackjack

%This procedure adds the the players score
procedure Add_To_The_Players_Score_Blackjack
    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)

    %This makes sure that the time limit for the game isn't over
    if Condition_Time_Limit_Blackjack not= 1 then
	Draw.Text ("$", 350, 20, Font_Waiting_Opening, black)

	%This displays the current principal of the player
	String_Current_Principal_Blackjack := intstr (Current_Principal_Of_Player_Blackjack, 1)
	Text_Current_Principal_Blackjack := String_Current_Principal_Blackjack
	Draw.Text (Text_Current_Principal_Blackjack, 365, 20, Font_Waiting_Opening, black)
    end if
end Add_To_The_Players_Score_Blackjack

%This procedure is called decide who has won the individual games
procedure Monitor_Verdict_Of_Individual_Game_Blackjack
    if Dealers_Sum_Score_Blackjack > 21 then
	if Players_Sum_Score_Blackjack <= 21 then
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	    Draw.Text ("You Have Won This Hand", 225, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)

	    Current_Principal_Of_Player_Blackjack := Current_Principal_Of_Player_Blackjack + Current_Bet_Of_Player_Blackjack

	    delay (1500)
	    Monitor_GUI_Top_Panel_Blackjack := 1
	end if
    end if

    if Dealers_Sum_Score_Blackjack <= 21 then
	if Players_Sum_Score_Blackjack <= 21 then
	    if Dealers_Sum_Score_Blackjack >= Players_Sum_Score_Blackjack then
		drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
		drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
		drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

		Draw.Text ("You Have Lost This Hand", 230, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)

		Current_Principal_Of_Player_Blackjack := Current_Principal_Of_Player_Blackjack - Current_Bet_Of_Player_Blackjack

		delay (1500)
		Monitor_GUI_Top_Panel_Blackjack := 1
	    end if
	end if
    end if

    if Players_Sum_Score_Blackjack <= 21 then
	if Players_Sum_Score_Blackjack = Dealers_Sum_Score_Blackjack then
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	    Draw.Text ("You Have Lost This Hand", 230, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)

	    Current_Principal_Of_Player_Blackjack := Current_Principal_Of_Player_Blackjack - Current_Bet_Of_Player_Blackjack

	    delay (1500)
	    Monitor_GUI_Top_Panel_Blackjack := 1
	elsif Players_Sum_Score_Blackjack > Dealers_Sum_Score_Blackjack then
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	    Draw.Text ("You Have Won This Hand", 225, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)

	    Current_Principal_Of_Player_Blackjack := Current_Principal_Of_Player_Blackjack + Current_Bet_Of_Player_Blackjack

	    delay (1500)
	    Monitor_GUI_Top_Panel_Blackjack := 1
	end if
    end if

    if Players_Sum_Score_Blackjack > 21 then
	if Dealers_Sum_Score_Blackjack <= 21 then
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)
	    Draw.Text ("Please Wait While The Dealer Plays", 212, 338, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)

	    delay (1000)

	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	    Draw.Text ("You Have Lost This Hand", 230, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)

	    Current_Principal_Of_Player_Blackjack := Current_Principal_Of_Player_Blackjack - Current_Bet_Of_Player_Blackjack

	    delay (1500)
	    Monitor_GUI_Top_Panel_Blackjack := 1
	elsif Dealers_Sum_Score_Blackjack >= 22 then
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)
	    Draw.Text ("Please Wait While The Dealer Plays", 212, 338, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)

	    delay (1000)
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	    Draw.Text ("You Have Lost This Hand", 230, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)

	    Current_Principal_Of_Player_Blackjack := Current_Principal_Of_Player_Blackjack - Current_Bet_Of_Player_Blackjack

	    delay (1500)
	    Monitor_GUI_Top_Panel_Blackjack := 1
	end if
    end if
end Monitor_Verdict_Of_Individual_Game_Blackjack

%This procedure assign the values of the card to the randomly chosen
%cards for the dealer so the computer can decide the best possible move
procedure Assign_The_Value_Of_Card_To_The_Dealer_Blackjack
    if Random_Card_Choose_Dealer_Blackjack <= 4 then
	Value_Of_Card_Drawn_Blackjack := 2
    elsif Random_Card_Choose_Dealer_Blackjack <= 8 then
	Value_Of_Card_Drawn_Blackjack := 3
    elsif Random_Card_Choose_Dealer_Blackjack <= 12 then
	Value_Of_Card_Drawn_Blackjack := 4
    elsif Random_Card_Choose_Dealer_Blackjack <= 16 then
	Value_Of_Card_Drawn_Blackjack := 5
    elsif Random_Card_Choose_Dealer_Blackjack <= 20 then
	Value_Of_Card_Drawn_Blackjack := 6
    elsif Random_Card_Choose_Dealer_Blackjack <= 24 then
	Value_Of_Card_Drawn_Blackjack := 7
    elsif Random_Card_Choose_Dealer_Blackjack <= 28 then
	Value_Of_Card_Drawn_Blackjack := 8
    elsif Random_Card_Choose_Dealer_Blackjack <= 32 then
	Value_Of_Card_Drawn_Blackjack := 9
    elsif Random_Card_Choose_Dealer_Blackjack <= 48 then
	Value_Of_Card_Drawn_Blackjack := 10
    elsif Random_Card_Choose_Dealer_Blackjack <= 52 then
	if Dealers_Sum_Score_Blackjack + 11 <= 21 then
	    Value_Of_Card_Drawn_Blackjack := 11
	elsif Dealers_Sum_Score_Blackjack + 11 >= 22 then
	    Value_Of_Card_Drawn_Blackjack := 1
	end if
    end if
end Assign_The_Value_Of_Card_To_The_Dealer_Blackjack

%This procedure includes the A.I for the blackjack dealer so the dealer can play the best possible game
procedure Dealer_Game_Play_Blackjack
    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

    Draw.Text ("Please Wait While The Dealer Plays", 212, 338, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)

    The_Dealer_Is_Drawing := 1
    The_Player_Is_Drawing := 0
    Count_Dealer_Card_Draw_Loop_Blackjack := 0

    %This disables the players gui's to prevent an error
    GUI.Disable (GUI_Change_Bet_Blackjack)
    GUI.Disable (GUI_Get_Hint_Blackjack)
    GUI.Disable (GUI_Stand_Blackjack)
    GUI.Disable (GUI_Hit_Blackjack)

    randint (Random_Card_Choose_Dealer_Blackjack, 1, 52)

    Count_Dealer_Card_Draw_Loop_Blackjack := Count_Dealer_Card_Draw_Loop_Blackjack + 1
    Draw_A_Card_From_Deck_Blackjack

    %This checks to see if the player has gone over 21
    if Players_Sum_Score_Blackjack <= 21 then

	delay (1000)

	randint (Random_Card_Choose_Dealer_Blackjack, 1, 52)

	Count_Dealer_Card_Draw_Loop_Blackjack := Count_Dealer_Card_Draw_Loop_Blackjack + 1
	Draw_A_Card_From_Deck_Blackjack

	delay (1000)

	%This is the AI loop which allows the dealer to make the best moves possible
	loop
	    randint (Random_Card_Choose_Dealer_Blackjack, 1, 52)
	    Assign_The_Value_Of_Card_To_The_Dealer_Blackjack

	    if Dealers_Sum_Score_Blackjack >= Players_Sum_Score_Blackjack then
		exit
	    elsif Dealers_Sum_Score_Blackjack < Players_Sum_Score_Blackjack then
		Count_Dealer_Card_Draw_Loop_Blackjack := Count_Dealer_Card_Draw_Loop_Blackjack + 1
		Draw_A_Card_From_Deck_Blackjack
	    end if

	    delay (1000)
	end loop
    end if

    %This decides who has won the game
    Monitor_Verdict_Of_Individual_Game_Blackjack
end Dealer_Game_Play_Blackjack

%This procedure is called to monitor the scoring of the game
procedure Monitor_Scoring_Of_Game_Blackjack
    if Players_Sum_Score_Blackjack = 21 then
	%This disables the players gui's to prevent an error
	GUI.Disable (GUI_Change_Bet_Blackjack)
	GUI.Disable (GUI_Get_Hint_Blackjack)
	GUI.Disable (GUI_Stand_Blackjack)
	GUI.Disable (GUI_Hit_Blackjack)

	Dealer_Game_Play_Blackjack
    elsif Players_Sum_Score_Blackjack > 21 then
	%This disables the players gui's to prevent an error
	GUI.Disable (GUI_Change_Bet_Blackjack)
	GUI.Disable (GUI_Get_Hint_Blackjack)
	GUI.Disable (GUI_Stand_Blackjack)
	GUI.Disable (GUI_Hit_Blackjack)

	Dealer_Game_Play_Blackjack
    end if

    %This checks if the time limit is up
    if Text_Time_Blackjack = "0" then
	Condition_Time_Limit_Blackjack := 1
	Verdict_Of_The_Game_Blackjack
    end if
end Monitor_Scoring_Of_Game_Blackjack

%This procedure is called upon when the player presses the hit button
procedure Player_Hit_Blackjack
    The_Dealer_Is_Drawing := 0
    The_Player_Is_Drawing := 1

    Draw.Text ("Hit", 315, 93, Font_Waiting_Opening, black)

    Count_Player_Card_Draw_Loop_Blackjack := Count_Player_Card_Draw_Loop_Blackjack + 1
    Draw_A_Card_From_Deck_Blackjack
    Monitor_Scoring_Of_Game_Blackjack
    Add_To_The_Players_Score_Blackjack
end Player_Hit_Blackjack

%This procedure is called upon when the player hits the stand button
procedure Player_Stand_Blackjack
    Draw.Text ("Stand", 432, 93, Font_Waiting_Opening, black)

    delay (1000)
    Dealer_Game_Play_Blackjack
end Player_Stand_Blackjack

%This is the clear screen procedure for the gui's used in the below section
procedure Animation_GUIs_For_Blackjack
    cls
end Animation_GUIs_For_Blackjack

%This procedure animates the GUI for when the player decides that he or she wants to change
%the current bet being used in the game
procedure Player_Change_Bet_Blackjack
    Draw.Text ("Change Bet", 133, 93, Font_Waiting_Opening, black)

    for Animate_Button : 0 .. 30
	%Animate GUI for changing bet
	GUI_Animate_Change_Bet_Blackjack := GUI.CreateButton (120, 120, 0, " ", Animation_GUIs_For_Blackjack)
	newWidth := 132
	newHeight := 10 + Animate_Button
	GUI.SetSize (GUI_Animate_Change_Bet_Blackjack, newWidth, newHeight)
	GUI.Disable (GUI_Animate_Change_Bet_Blackjack)

	delay (40)
    end for

    %This loop verifies that the bet being made does not conflict with betting requirements
    loop
	drawfillbox (135, 125, 235, 150, white)

	locate (26, 20)
	put "$" ..

	locate (26, 22)
	get Change_The_Bet

	%These if statements ensure that the betting requirements are followed
	if Change_The_Bet >= 500 then
	    if Change_The_Bet <= 10000 then
		exit
	    end if
	end if

	if Change_The_Bet < 500 then
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	    Draw.Text ("You Must Have A Minumum Bet Of", 222, 348, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)
	    Draw.Text ("$500", 360, 328, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)

	    delay (1500)

	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)
	elsif Change_The_Bet > 10000 then
	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)

	    Draw.Text ("You Have Exceeded The Maximum Bet", 198, 348, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)
	    Draw.Text ("Of $10, 000", 335, 328, Font_For_Centre_Display_Blackjack, Panel_Writing_For_Black_Jack)

	    delay (1500)

	    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
	    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
	    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)
	end if
    end loop

    for decreasing Animate_Button : 30 .. 0
	%Animate GUI for changing bet
	GUI_Animate_Change_Bet_Blackjack := GUI.CreateButton (120, 120, 0, " ", Animation_GUIs_For_Blackjack)
	newWidth := 132
	newHeight := 10 + Animate_Button
	GUI.SetSize (GUI_Animate_Change_Bet_Blackjack, newWidth, newHeight)
	GUI.Disable (GUI_Animate_Change_Bet_Blackjack)

	delay (40)
	drawfillbox (120, 121, 251, 160, Background_Colour_Blackjack)
    end for

    Current_Bet_Of_Player_Blackjack := Change_The_Bet

    drawfillbox (120, 121, 251, 160, Background_Colour_Blackjack)
    drawfillbox (161, 13, 227, 39, white)
    drawfillarc (162, 26, 14, 14, 90, 270, white)
    drawfillarc (226, 26, 14, 14, 270, 90, white)
    Draw.Text ("$", 165, 20, Font_Waiting_Opening, black)

    %This displays the current bet of the player
    String_Current_Bet_Blackjack := intstr (Current_Bet_Of_Player_Blackjack, 1)
    Text_Current_Bet_Blackjack := String_Current_Bet_Blackjack
    Draw.Text (Text_Current_Bet_Blackjack, 180, 20, Font_Waiting_Opening, black)

    %Tells the player that it is his or her turn to play
    drawfillbox (200, 322, maxx - 200, 368, Panel_Colour_For_Blackjack)
    drawfillarc (202, 345, 23, 23, 90, 270, Panel_Colour_For_Blackjack)
    drawfillarc (maxx - 202, 345, 23, 23, 270, 90, Panel_Colour_For_Blackjack)
    Draw.Text ("It Is Your Turn To Play", 246, 338, Font_Music_Buttons, Panel_Writing_For_Black_Jack)
end Player_Change_Bet_Blackjack

%This procedure gives the player a hint on what to do during the game, it is a mere approximation
%of the best move to take for the player, is will not always ensure the victory of the player
procedure Player_Get_Hint_Blackjack
    Draw.Text ("Hint", 580, 93, Font_Waiting_Opening, black)

    for Animate_Button : 0 .. 30
	%Animate GUI for changing bet
	GUI_Animate_Change_Bet_Blackjack := GUI.CreateButton (537, 120, 0, " ", Animation_GUIs_For_Blackjack)
	newWidth := 132
	newHeight := 10 + Animate_Button
	GUI.SetSize (GUI_Animate_Change_Bet_Blackjack, newWidth, newHeight)
	GUI.Disable (GUI_Animate_Change_Bet_Blackjack)

	delay (40)
    end for

    drawfillbox (552, 128, 652, 150, white)

    %This decised whether to recommend the player to hit or stand in the game
    if Players_Sum_Score_Blackjack >= 17 then
	Draw.Text ("Stand", 575, 133, Font_Waiting_Opening, black)
    elsif Players_Sum_Score_Blackjack <= 16 then
	Draw.Text ("Hit", 585, 133, Font_Waiting_Opening, black)
    end if

    delay (1000)

    for decreasing Animate_Button : 30 .. 0
	%Animate GUI for changing bet
	GUI_Animate_Change_Bet_Blackjack := GUI.CreateButton (537, 120, 0, " ", Animation_GUIs_For_Blackjack)
	newWidth := 132
	newHeight := 10 + Animate_Button
	GUI.SetSize (GUI_Animate_Change_Bet_Blackjack, newWidth, newHeight)
	GUI.Disable (GUI_Animate_Change_Bet_Blackjack)

	delay (40)
	drawfillbox (537, 121, 668, 160, Background_Colour_Blackjack)
    end for

    drawfillbox (537, 121, 668, 160, Background_Colour_Blackjack)
end Player_Get_Hint_Blackjack

%This procedure draws the back panel cards for the layout depending on which panel was selected provious
%to the start of the game
procedure Draw_The_Deck_Blackjack
    %Deck Of Cards - Player
    var Card_Picture_Player_1 : int := Pic.FileNew (Back_Panel_Identification)
    Pic.SetTransparentColor (Card_Picture_Player_1, brightred)
    Pic.Draw (Card_Picture_Player_1, 262, 175, picMerge)

    %Deck Of Cards - Dealer
    var Card_Picture_Dealer_1 : int := Pic.FileNew (Back_Panel_Identification)
    Pic.SetTransparentColor (Card_Picture_Dealer_1, brightred)
    Pic.Draw (Card_Picture_Dealer_1, 262, 385, picMerge)
end Draw_The_Deck_Blackjack

%This procedure draws the main GUI's for this game that are seen in the bottom panle of the game
procedure GUI_Buttons_For_Panel_Blackjack
    %Change Bet GUI
    GUI_Change_Bet_Blackjack := GUI.CreateButton (120, 82, 0, " ", Player_Change_Bet_Blackjack)
    newWidth := 132
    newHeight := 33
    GUI.SetSize (GUI_Change_Bet_Blackjack, newWidth, newHeight)

    %Get Hint GUI
    GUI_Get_Hint_Blackjack := GUI.CreateButton (537, 82, 0, " ", Player_Get_Hint_Blackjack)
    newWidth := 132
    newHeight := 33
    GUI.SetSize (GUI_Get_Hint_Blackjack, newWidth, newHeight)

    %Hit GUI
    GUI_Hit_Blackjack := GUI.CreateButton (290, 82, 0, " ", Player_Hit_Blackjack)
    newWidth := 82
    newHeight := 33
    GUI.SetSize (GUI_Hit_Blackjack, newWidth, newHeight)

    %Stand GUI
    GUI_Stand_Blackjack := GUI.CreateButton (417, 82, 0, " ", Player_Stand_Blackjack)
    newWidth := 82
    newHeight := 33
    GUI.SetSize (GUI_Stand_Blackjack, newWidth, newHeight)

    %Writing For The Top Panel GUI's
    Draw.Text ("Change Bet", 133, 93, Font_Waiting_Opening, black)
    Draw.Text ("Hit", 315, 93, Font_Waiting_Opening, black)
    Draw.Text ("Stand", 432, 93, Font_Waiting_Opening, black)
    Draw.Text ("Hint", 580, 93, Font_Waiting_Opening, black)

    %GUI for the dealer's total
    GUI_Total_Dealer_Blackjack := GUI.CreateButton (117, 384, 0, " ", Animation_GUIs_For_Blackjack)
    newWidth := 122
    newHeight := 133
    GUI.SetSize (GUI_Total_Dealer_Blackjack, newWidth, newHeight)
    GUI.Disable (GUI_Total_Dealer_Blackjack)

    %GUI for the top of the dealer's total
    GUI_Total_Top_Dealer_Blackjack := GUI.CreateButton (117, 484, 0, " ", Animation_GUIs_For_Blackjack)
    newWidth := 121
    newHeight := 33
    GUI.SetSize (GUI_Total_Top_Dealer_Blackjack, newWidth, newHeight)
    GUI.SetColour (GUI_Total_Top_Dealer_Blackjack, black)
    GUI.Disable (GUI_Total_Top_Dealer_Blackjack)

    %GUI for the bottom of the dealer's total
    GUI_Total_Bottom_Dealer_Blackjack := GUI.CreateButton (117, 385, 0, " ", Animation_GUIs_For_Blackjack)
    newWidth := 121
    newHeight := 33
    GUI.SetSize (GUI_Total_Bottom_Dealer_Blackjack, newWidth, newHeight)
    GUI.SetColour (GUI_Total_Bottom_Dealer_Blackjack, black)
    GUI.Disable (GUI_Total_Bottom_Dealer_Blackjack)

    %GUI for the players total
    GUI_Total_Player_Blackjack := GUI.CreateButton (117, 173, 0, " ", Animation_GUIs_For_Blackjack)
    newWidth := 122
    newHeight := 133
    GUI.SetSize (GUI_Total_Player_Blackjack, newWidth, newHeight)
    GUI.Disable (GUI_Total_Player_Blackjack)

    %GUI for the top of the player's total
    GUI_Total_Top_Player_Blackjack := GUI.CreateButton (117, 273, 0, " ", Animation_GUIs_For_Blackjack)
    newWidth := 122
    newHeight := 33
    GUI.SetSize (GUI_Total_Top_Player_Blackjack, newWidth, newHeight)
    GUI.SetColour (GUI_Total_Top_Player_Blackjack, black)
    GUI.Disable (GUI_Total_Top_Player_Blackjack)

    %GUI for the bottom of the player's total
    GUI_Total_Bottom_Player_Blackjack := GUI.CreateButton (117, 174, 0, " ", Animation_GUIs_For_Blackjack)
    newWidth := 122
    newHeight := 33
    GUI.SetSize (GUI_Total_Bottom_Player_Blackjack, newWidth, newHeight)
    GUI.SetColour (GUI_Total_Bottom_Player_Blackjack, black)
    GUI.Disable (GUI_Total_Bottom_Player_Blackjack)

    %Titles for the total sums
    %Dealer
    Draw.Text ("TOTAL", 142, 493, Font_Waiting_Opening, white)
    Draw.Text ("DEALER", 137, 394, Font_Waiting_Opening, white)
    %Player
    Draw.Text ("TOTAL", 142, 283, Font_Waiting_Opening, white)

    %This arranges the name of the player on the screen according to the length
    %of his or her name
    if length (Name_Of_Player) <= 4 then
	Location_X_Name_Blackjack := 155
    elsif length (Name_Of_Player) <= 6 then
	Location_X_Name_Blackjack := 151
    elsif length (Name_Of_Player) <= 8 then
	Location_X_Name_Blackjack := 142
    elsif length (Name_Of_Player) <= 10 then
	Location_X_Name_Blackjack := 135
    elsif length (Name_Of_Player) >= 11 then
	Location_X_Name_Blackjack := 126
    end if

    %This displays the players name on the layout screen
    Draw.Text (Name_Of_Player, Location_X_Name_Blackjack, 183, Font_Waiting_Opening, white)

    %Supplementary Information - player and dealer totals
    %Dealers Score
    Draw.Text ("0", 165, 434, Font_For_Total_Display_Blackjack, black)

    %Players Score
    Draw.Text ("0", 165, 224, Font_For_Total_Display_Blackjack, black)

    %This calls on the procedure to draw the back panel cards
    Draw_The_Deck_Blackjack

    %This is the GUI.ProcessEvent loop to ensure that the GUI's will work
    loop
	exit when GUI.ProcessEvent
	if Monitor_GUI_Top_Panel_Blackjack = 1 then
	    exit
	end if
    end loop
end GUI_Buttons_For_Panel_Blackjack

%Main Program
%This resets some of the numerical values for the game replays


%Randomly_Choose_Waiting_Screen



Count_Player_Card_Draw_Loop_Blackjack := 0
Count_Dealer_Card_Draw_Loop_Blackjack := 0
Condition_Exit_Principle_Blackjack := 0
Time_Monitor_For_Blackjack := 0
Condition_Time_Limit_Blackjack := 0
Condition_Win_Game_Blackjack := 1
Players_Sum_Score_Blackjack := 0
Dealers_Sum_Score_Blackjack := 0
The_Player_Is_Drawing := 0
The_Dealer_Is_Drawing := 0
Count_Game_Number_Blackjack := 1
Count_Round_Number_Blackjack := 1
Current_Bet_Of_Player_Blackjack := 500
Current_Principal_Of_Player_Blackjack := 0
Set_Initial_Parameters

fork Time_Count_Blackjack

loop
    %This resets some of the numerical values for the game replays
    Monitor_GUI_Top_Panel_Blackjack := 0
    Count_Player_Card_Draw_Loop_Blackjack := 0
    Count_Dealer_Card_Draw_Loop_Blackjack := 0
    Players_Sum_Score_Blackjack := 0
    Dealers_Sum_Score_Blackjack := 0
    The_Player_Is_Drawing := 0
    The_Dealer_Is_Drawing := 0

    Draw_Bottom_Panel_For_Blackjack
    GUI_Buttons_For_Panel_Blackjack

    %This enables the players gui's to prevent an error
    GUI.Enable (GUI_Change_Bet_Blackjack)
    GUI.Enable (GUI_Get_Hint_Blackjack)
    GUI.Enable (GUI_Stand_Blackjack)
    GUI.Enable (GUI_Hit_Blackjack)

    Count_Game_Number_Blackjack := Count_Game_Number_Blackjack + 1

    if Count_Game_Number_Blackjack = 3 then
	Count_Round_Number_Blackjack := Count_Round_Number_Blackjack + 1
	Count_Game_Number_Blackjack := 1
    end if

    drawfillbox (558, 13, 624, 39, white)
    drawfillarc (559, 26, 14, 14, 90, 270, white)
    drawfillarc (623, 26, 14, 14, 270, 90, white)

    %This displays the game number for the game
    String_Game_Number_Blackjack := intstr (Count_Game_Number_Blackjack, 1)
    Text_Game_Number_Blackjack := String_Game_Number_Blackjack
    Draw.Text (Text_Game_Number_Blackjack, 585, 20, Font_Waiting_Opening, black)

    drawfillbox (682, 13, 748, 39, white)
    drawfillarc (683, 26, 14, 14, 90, 270, white)
    drawfillarc (747, 26, 14, 14, 270, 90, white)

    %This displays the round number for the game
    String_Round_Number_Blackjack := intstr (Count_Round_Number_Blackjack, 1)
    Text_Round_Number_Blackjack := String_Round_Number_Blackjack
    Draw.Text (Text_Round_Number_Blackjack, 708, 20, Font_Waiting_Opening, black)

    %This checks if the player has won the game by achieving the desired score
    if Current_Principal_Of_Player_Blackjack >= 100000 then
	exit
    end if

    %This checks if the players principal goes below 0
    if Current_Principal_Of_Player_Blackjack < 0 then
	exit
    end if

    %This checks if the player has run out of time
    if Condition_Time_Limit_Blackjack = 1 then
	exit
    end if

    %This delays the replay of the games
    delay (750)
end loop

%This tells the player the verdict of the entire game
Verdict_Of_The_Game_Blackjack
