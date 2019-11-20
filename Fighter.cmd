; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------

;RyukoRanbuPunch
[Command]
name = "Ranbux"
command = D, DF, F, DF, D, DB, B, x
time = 30
[Command]
name = "Ranbux"
command = D, F, D, B, x
time = 30
[Command]
name = "Ranbux"
command = ~D, DF, F, DF, D, DB, B, x
time = 30
[Command]
name = "Ranbux"
command = ~D, F, D, B, x
time = 30
[Command]
name = "Ranbuy"
command = D, DF, F, DF, D, DB, B, y
time = 30
[Command]
name = "Ranbuy"
command = D, F, D, B, y
time = 30
[Command]
name = "Ranbuy"
command = ~D, DF, F, DF, D, DB, B, y
time = 30
[Command]
name = "Ranbuy"
command = ~D, F, D, B, y
time = 30

;ReverseRanbuPunch
[Command]
name = "RRanbux"
command = D, DB, B, DB, D, DF, F, x
time = 30
[Command]
name = "RRanbux"
command = D, B, D, F, x
time = 30
[Command]
name = "RRanbux"
command = ~D, DB, B, DB, D, DF, F, x
time = 30
[Command]
name = "RRanbux"
command = ~D, B, D, F, x
time = 30
[Command]
name = "RRanbuy"
command = D, DB, B, DB, D, DF, F, y
time = 30
[Command]
name = "RRanbuy"
command = D, B, D, F, y
time = 30
[Command]
name = "RRanbuy"
command = ~D, DB, B, DB, D, DF, F, y
time = 30
[Command]
name = "RRanbuy"
command = ~D, B, D, F, y
time = 30

[Command]
name = "RRanbuxy"
command = D, DB, B, DB, D, DF, F, x+y
time = 30
[Command]
name = "RRanbuxy"
command = D, B, D, F, x+y
time = 30
[Command]
name = "RRanbuxy"
command = ~D, DB, B, DB, D, DF, F, x+y
time = 30
[Command]
name = "RRanbuxy"
command = ~D, B, D, F, x+y
time = 30

;2HCBKick
[Command]
name = "2HCBa"
command = F, DF, D, DB, B, F, DF, D, DB, B, a
time = 45
[Command]
name = "2HCBa"
command = F, D, B, F, D, B, a
time = 45
[Command]
name = "2HCBa"
command = ~F, DF, D, DB, B, F, DF, D, DB, B, a
time = 45
[Command]
name = "2HCBa"
command = ~F, D, B, F, D, B, a
time = 45
[Command]
name = "2HCBb"
command = F, DF, D, DB, B, F, DF, D, DB, B, b
time = 45
[Command]
name = "2HCBb"
command = F, D, B, F, D, B, b
time = 45
[Command]
name = "2HCBb"
command = ~F, DF, D, DB, B, F, DF, D, DB, B, b
time = 45
[Command]
name = "2HCBb"
command = ~F, D, B, F, D, B, b
time = 45

;2QCBPunch
[Command]
name = "2QCBx"
command = D, DB, B, D, DB, B, x
time = 25
[Command]
name = "2QCBx"
command = D, B, D, B, x
time = 25
[Command]
name = "2QCBx"
command = ~D, DB, B, D, DB, B, x
time = 25
[Command]
name = "2QCBx"
command = ~D, B, D, B, x
time = 25
[Command]
name = "2QCBy"
command = D, DB, B, D, DB, B, y
time = 25
[Command]
name = "2QCBy"
command = D, B, D, B, y
time = 25
[Command]
name = "2QCBy"
command = ~D, DB, B, D, DB, B, y
time = 25
[Command]
name = "2QCBy"
command = ~D, B, D, B, y
time = 25

[Command]
name = "2QCBxy"
command = D, DB, B, D, DB, B, x+y
time = 25
[Command]
name = "2QCBxy"
command = D, B, D, B, x+y
time = 25
[Command]
name = "2QCBxy"
command = ~D, DB, B, D, DB, B, x+y
time = 25
[Command]
name = "2QCBxy"
command = ~D, B, D, B, x+y
time = 25

;2QCFPunch
[Command]
name = "2QCFx"
command = D, DF, F, D, DF, F, x
time = 25
[Command]
name = "2QCFx"
command = D, F, D, F, x
time = 25
[Command]
name = "2QCFx"
command = ~D, DF, F, D, DF, F, x
time = 25
[Command]
name = "2QCFx"
command = ~D, F, D, F, x
time = 25
[Command]
name = "2QCFy"
command = D, DF, F, D, DF, F, y
time = 25
[Command]
name = "2QCFy"
command = D, F, D, F, y
time = 25
[Command]
name = "2QCFy"
command = ~D, DF, F, D, DF, F, y
time = 25
[Command]
name = "2QCFy"
command = ~D, F, D, F, y
time = 25

[Command]
name = "2QCFxy"
command = D, DF, F, D, DF, F, x+y
time = 25
[Command]
name = "2QCFxy"
command = D, F, D, F, x+y
time = 25
[Command]
name = "2QCFxy"
command = ~D, DF, F, D, DF, F, x+y
time = 25
[Command]
name = "2QCFxy"
command = ~D, F, D, F, x+y
time = 25

;2QCFKick
[Command]
name = "2QCFa"
command = D, DF, F, D, DF, F, a
time = 25
[Command]
name = "2QCFa"
command = D, F, D, F, a
time = 25
[Command]
name = "2QCFa"
command = ~D, DF, F, D, DF, F, a
time = 25
[Command]
name = "2QCFa"
command = ~D, F, D, F, a
time = 25
[Command]
name = "2QCFb"
command = D, DF, F, D, DF, F, b
time = 25
[Command]
name = "2QCFb"
command = D, F, D, F, b
time = 25
[Command]
name = "2QCFb"
command = ~D, DF, F, D, DF, F, b
time = 25
[Command]
name = "2QCFb"
command = ~D, F, D, F, b
time = 25

[Command]
name = "2QCFab"
command = D, DF, F, D, DF, F, a+b
time = 25
[Command]
name = "2QCFab"
command = D, F, D, F, a+b
time = 25
[Command]
name = "2QCFab"
command = ~D, DF, F, D, DF, F, a+b
time = 25
[Command]
name = "2QCFab"
command = ~D, F, D, F, a+b
time = 25

;-| Special Motions |------------------------------------------------------

;Z-MotionKick
[Command]
name = "ZMa"
command = F, D, DF, a
time = 12
[Command]
name = "ZMa"
command = ~F, D, DF, a
time = 12
[Command]
name = "ZMb"
command = F, D, DF, b
time = 12
[Command]
name = "ZMb"
command = ~F, D, DF, b
time = 12

;Z-MotionPunch
[Command]
name = "ZMx"
command = F, D, DF, x
time = 12
[Command]
name = "ZMx"
command = ~F, D, DF, x
time = 12
[Command]
name = "ZMx"
command = DF, DF, x
time = 12
[Command]
name = "ZMx"
command = ~DF, DF, x
time = 12
[Command]
name = "ZMy"
command = F, D, DF, y
time = 12
[Command]
name = "ZMy"
command = ~F, D, DF, y
time = 12
[Command]
name = "ZMy"
command = DF, DF, y
time = 12
[Command]
name = "ZMy"
command = ~DF, DF, y
time = 12

;QCFPunch
[Command]
name = "QCFx"
command = D, DF, F, x
time = 15
[Command]
name = "QCF-x"
command = D, F, x
time = 15
[Command]
name = "QCFx"
command = ~D, DF, F, x
time = 15
[Command]
name = "QCF-x"
command = ~D, F, x
time = 15
[Command]
name = "QCFy"
command = D, DF, F, y
time = 15
[Command]
name = "QCF-y"
command = D, F, y
time = 15
[Command]
name = "QCFy"
command = ~D, DF, F, y
time = 15
[Command]
name = "QCF-y"
command = ~D, F, y
time = 15

;QCFKick
[Command]
name = "QCFa"
command = D, DF, F, a
time = 15
[Command]
name = "QCFa"
command = D, F, a
time = 15
[Command]
name = "QCFa"
command = ~D, DF, F, a
time = 15
[Command]
name = "QCFa"
command = ~D, F, a
time = 15
[Command]
name = "QCFb"
command = D, DF, F, b
time = 15
[Command]
name = "QCFb"
command = D, F, b
time = 15
[Command]
name = "QCFb"
command = ~D, DF, F, b
time = 15
[Command]
name = "QCFb"
command = ~D, F, b
time = 15

;QCBPunch
[Command]
name = "QCBx"
command = D, DB, B, x
time = 15
[Command]
name = "QCBx"
command = D, B, x
time = 15
[Command]
name = "QCBx"
command = ~D, DB, B, x
time = 15
[Command]
name = "QCBx"
command = ~D, B, x
time = 15
[Command]
name = "QCBy"
command = D, DB, B, y
time = 15
[Command]
name = "QCBy"
command = D, B, y
time = 15
[Command]
name = "QCBy"
command = ~D, DB, B, y
time = 15
[Command]
name = "QCBy"
command = ~D, B, y
time = 15

;QCBKick
[Command]
name = "QCBa"
command = D, DB, B, a
time = 15
[Command]
name = "QCBa"
command = D, B, a
time = 15
[Command]
name = "QCBa"
command = ~D, DB, B, a
time = 15
[Command]
name = "QCBa"
command = ~D, B, a
time = 15
[Command]
name = "QCBb"
command = D, DB, B, b
time = 15
[Command]
name = "QCBb"
command = D, B, b
time = 15
[Command]
name = "QCBb"
command = ~D, DB, B, b
time = 15
[Command]
name = "QCBb"
command = ~D, B, b
time = 15

;HCFPunch
[Command]
name = "HCFx"
command = B, DB, D, DF, F, x
time = 15
[Command]
name = "HCFx"
command = B, D, F, x
time = 15
[Command]
name = "HCFx"
command = ~B, DB, D, DF, F, x
time = 15
[Command]
name = "HCFx"
command = ~B, D, F, x
time = 15
[Command]
name = "HCFy"
command = B, DB, D, DF, F, y
time = 15
[Command]
name = "HCFy"
command = B, D, F, y
time = 15
[Command]
name = "HCFy"
command = ~B, DB, D, DF, F, y
time = 15
[Command]
name = "HCFy"
command = ~B, D, F, y
time = 15

;HCFKick
[Command]
name = "HCFa"
command = B, DB, D, DF, F, a
time = 15
[Command]
name = "HCFa"
command = B, D, F, a
time = 15
[Command]
name = "HCFa"
command = ~B, DB, D, DF, F, a
time = 15
[Command]
name = "HCFa"
command = ~B, D, F, a
time = 15
[Command]
name = "HCFb"
command = B, DB, D, DF, F, b
time = 15
[Command]
name = "HCFb"
command = B, D, F, b
time = 15
[Command]
name = "HCFb"
command = ~B, DB, D, DF, F, b
time = 15
[Command]
name = "HCFb"
command = ~B, D, F ,b
time = 15

;HCBPunch
[Command]
name = "HCBx"
command = F, DF, D, DB, B, x
time = 15
[Command]
name = "HCBx"
command = F, D, B, x
time = 15
[Command]
name = "HCBx"
command = ~F, DF, D, DB, B, x
time = 15
[Command]
name = "HCBx"
command = ~F, D, B, x
time = 15
[Command]
name = "HCBy"
command = F, DF, D, DB, B, y
time = 15
[Command]
name = "HCBy"
command = F, D, B, y
time = 15
[Command]
name = "HCBy"
command = ~F, DF, D, DB, B, y
time = 15
[Command]
name = "HCBy"
command = ~F, D, B, y
time = 15

;HCBKick
[Command]
name = "HCBa"
command = F, DF, D, DB, B, a
time = 15
[Command]
name = "HCBa"
command = F, D, B, a
time = 15
[Command]
name = "HCBa"
command = ~F, DF, D, DB, B, a
time = 15
[Command]
name = "HCBa"
command = ~F, D, B, a
time = 15
[Command]
name = "HCBb"
command = F, DF, D, DB, B, b
time = 15
[Command]
name = "HCBb"
command = F, D, B, b
time = 15
[Command]
name = "HCBb"
command = ~F, DF, D, DB, B, b
time = 15
[Command]
name = "HCBb"
command = ~F, D, B, b
time = 15

;DDPunch
[Command]
name = "DDx"
command = D, D, x
time = 15
[Command]
name = "DDx"
command = ~D, D, x
time = 15
[Command]
name = "DDy"
command = D, D, y
time = 15
[Command]
name = "DDy"
command = ~D, D, y
time = 15

;-| Command Motions |------------------------------------------------------

[Command]
name = "FX"
command = F+x
time  = 5

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; 2300
[State -1, Stand Light Punch]
type = ChangeState
value = 2300
triggerall = command = "RRanbuxy"
triggerall = var(59) = 0
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 4000
trigger3 = stateno = 951 || stateno = 1145 || stateno = 1150 || stateno = 1160 || stateno = 1166 || stateno = 1170
trigger4 = time >= 2 && power >= 4000
trigger4 = stateno = 915 || stateno = 1053 || stateno = 1123
trigger5 = time >= 2
trigger5 = stateno = 2266 || stateno = 2286

;---------------------------------------------------------------------------
; 2280
[State -1, Stand Light Punch]
type = ChangeState
value = 2280
triggerall = command = "2QCFab"
triggerall = var(59) = 0
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 3000
trigger3 = stateno = 951 || stateno = 1145 || stateno = 1150 || stateno = 1160 || stateno = 1166 || stateno = 1170
trigger4 = time >= 2 && power >= 3000
trigger4 = stateno = 915 || stateno = 1053 || stateno = 1123

;---------------------------------------------------------------------------
; 2260
[State -1, Stand Light Punch]
type = ChangeState
value = 2260
triggerall = command = "2QCFa" || command = "2QCFb"
triggerall = var(59) = 0
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 2000
trigger3 = stateno = 951 || stateno = 1145 || stateno = 1150 || stateno = 1160 || stateno = 1166 || stateno = 1170
trigger4 = time >= 2 && power >= 2000
trigger4 = stateno = 915 || stateno = 1053 || stateno = 1123

;---------------------------------------------------------------------------
; 2240
[State -1, Stand Light Punch]
type = ChangeState
value = 2240
triggerall = command = "RRanbux" || command = "RRanbuy"
triggerall = var(59) = 0
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 2000
trigger3 = stateno = 951 || stateno = 1145 || stateno = 1150 || stateno = 1160 || stateno = 1166 || stateno = 1170
trigger4 = time >= 2 && power >= 2000
trigger4 = stateno = 915 || stateno = 1053 || stateno = 1123

;---------------------------------------------------------------------------
; 2200
[State -1, Stand Light Punch]
type = ChangeState
value = 2220
triggerall = (command = "2QCFxy" && p2dist x >= 0 ) || (command = "2QCBxy" && p2dist x < 0)
triggerall = var(59) = 3
triggerall = power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 4000
trigger3 = stateno = 1300 || stateno = 1301 || stateno = 1310 || stateno = 1320 || stateno = 1330
trigger4 = numprojid(1000) != 0 && power >= 4000
trigger4 = stateno = 1201 || stateno = 1210
trigger5 = stateno = 1282 && time >= 2 && power >= 4000
trigger6 = stateno = 2160 && time <= 78
trigger7 = stateno = 2180 && time <= 120

;---------------------------------------------------------------------------
; 2200
[State -1, Stand Light Punch]
type = ChangeState
value = 2200
triggerall = command = "2QCFx" || command = "2QCFy"
triggerall = var(59) = 3
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 2000
trigger3 = stateno = 1300 || stateno = 1301 || stateno = 1310 || stateno = 1320 || stateno = 1330
trigger4 = numprojid(1000) != 0 && power >= 2000
trigger4 = stateno = 1201 || stateno = 1210
trigger5 = stateno = 1282 && time >= 2 && power >= 2000

;---------------------------------------------------------------------------
; 2180
[State -1, Stand Light Punch]
type = ChangeState
value = 2180
triggerall = command = "2QCFab"
triggerall = var(59) = 3
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 3000
trigger3 = stateno = 1300 || stateno = 1301 || stateno = 1310 || stateno = 1320 || stateno = 1330
trigger4 = numprojid(1000) != 0 && power >= 3000
trigger4 = stateno = 1201 || stateno = 1210
trigger5 = stateno = 1282 && time >= 2 && power >= 3000


;---------------------------------------------------------------------------
; 2160
[State -1, Stand Light Punch]
type = ChangeState
value = 2160
triggerall = command = "2QCFa" || command = "2QCFb"
triggerall = var(59) = 3
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 2000
trigger3 = stateno = 1300 || stateno = 1301 || stateno = 1310 || stateno = 1320 || stateno = 1330
trigger4 = numprojid(1000) != 0 && power >= 2000
trigger4 = stateno = 1201 || stateno = 1210
trigger5 = stateno = 1282 && time >= 2 && power >= 2000

;---------------------------------------------------------------------------
; 2140
[State -1, Stand Light Punch]
type = ChangeState
value = 2140
triggerall = command = "2QCFxy"
triggerall = var(59) = 1
triggerall = power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && statetype = S && power >= 4000
trigger3 = stateno = 1020 || stateno = 1030
trigger4 = stateno = 1182 && numprojid(1000) != 0 && power >= 4000 && var(1) != 2
trigger5 = stateno = 1182 && projcontacttime(1000) != -1 && projcontacttime(1000) <= 20 && power >= 4000 && var(1) != 2
trigger6 = time >= 10 && power >= 4000
trigger6 = stateno = 1240 || stateno = 1250
trigger7 = stateno = 1182 && projcontacttime(1000) != -1 && projcontacttime(1000) <= 20 && var(1) = 2
trigger8 = stateno >= 2080 && stateno <= 2120 && projcontacttime(2000) != -1 && projcontacttime(2000) <= 20
;---------------------------------------------------------------------------
; 2120
[State -1, Stand Light Punch]
type = ChangeState
value = 2120
triggerall = command = "2QCBxy"
triggerall = var(59) = 1
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && statetype = S && power >= 3000
trigger3 = stateno = 1020 || stateno = 1030
trigger4 = stateno = 1182 && numprojid(1000) != 0 && power >= 3000 && var(1) != 2
trigger5 = stateno = 1182 && projcontacttime(1000) != -1 && projcontacttime(1000) <= 20 && power >= 3000 && var(1) != 2
trigger6 = time >= 10  && power >= 3000
trigger6 = stateno = 1240 || stateno = 1250

;---------------------------------------------------------------------------
; 2100
[State -1, Stand Light Punch]
type = ChangeState
value = 2100
triggerall = command = "2QCBx"
triggerall = var(59) = 1
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && statetype = S && power >= 2000
trigger3 = stateno = 1020 || stateno = 1030
trigger4 = stateno = 1182 && numprojid(1000) != 0 && power >= 2000 && var(1) != 2
trigger5 = stateno = 1182 && projcontacttime(1000) != -1 && projcontacttime(1000) <= 20 && power >= 2000 && var(1) != 2
trigger6 = time >= 10  && power >= 2000
trigger6 = stateno = 1240 || stateno = 1250

;---------------------------------------------------------------------------
; 2110
[State -1, Stand Light Punch]
type = ChangeState
value = 2110
triggerall = command = "2QCBy"
triggerall = var(59) = 1
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && statetype = S && power >= 2000
trigger3 = stateno = 1020 || stateno = 1030
trigger4 = stateno = 1182 && numprojid(1000) != 0 && power >= 2000 && var(1) != 2
trigger5 = stateno = 1182 && projcontacttime(1000) != -1 && projcontacttime(1000) <= 20 && power >= 2000 && var(1) != 2
trigger6 = time >= 10  && power >= 2000
trigger6 = stateno = 1240 || stateno = 1250

;---------------------------------------------------------------------------
; 2080
[State -1, Stand Light Punch]
type = ChangeState
value = 2080
triggerall = command = "2QCFx" || command = "2QCFy"
triggerall = var(59) = 1
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && statetype = S && power >= 2000
trigger3 = stateno = 1020 || stateno = 1030
trigger4 = stateno = 1182 && numprojid(1000) != 0 && power >= 2000 && var(1) != 2
trigger5 = stateno = 1182 && projcontacttime(1000) != -1 && projcontacttime(1000) <= 20 && power >= 2000 && var(1) != 2
trigger6 = time >= 10  && power >= 2000
trigger6 = stateno = 1240 || stateno = 1250

;---------------------------------------------------------------------------
; 2060
[State -1, Stand Light Punch]
type = ChangeState
value = 2060
triggerall = command = "2QCFab"
triggerall = var(59) = 2
triggerall = power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 4000
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1045 || stateno = 1046 || stateno = 1065 || stateno = 1085 || stateno = 1100 || stateno = 1101 || stateno = 1102 || stateno = 1110
trigger4 = movecontact && time < 150
trigger4 = stateno = 2021 || stateno = 2041

;---------------------------------------------------------------------------
; 2040
[State -1, Stand Light Punch]
type = ChangeState
value = 2040
triggerall = command = "2QCFxy"
triggerall = var(59) = 2
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 3000
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1045 || stateno = 1046 || stateno = 1065 || stateno = 1085 || stateno = 1100 || stateno = 1101 || stateno = 1102 || stateno = 1110

;---------------------------------------------------------------------------
; 2020
[State -1, Stand Light Punch]
type = ChangeState
value = 2020
triggerall = command = "2QCFx" || command = "2QCFy"
triggerall = var(59) = 2
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 2000
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1045 || stateno = 1046 || stateno = 1065 || stateno = 1085 || stateno = 1100 || stateno = 1101 || stateno = 1102 || stateno = 1110

;---------------------------------------------------------------------------
; 2000
[State -1, Stand Light Punch]
type = ChangeState
value = 2000
triggerall = command = "2QCFa" || command = "2QCFb"
triggerall = var(59) = 2
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;super cancels
trigger3 = movecontact && power >= 2000
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1045 || stateno = 1046 || stateno = 1065 || stateno = 1085 || stateno = 1100 || stateno = 1101 || stateno = 1102 || stateno = 1110

;---------------------------------------------------------------------------
; 1320
[State -1, Stand Light Punch]
type = ChangeState
value = 1320
triggerall = command = "QCFa"
triggerall = var(59) = 3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1330
[State -1, Stand Light Punch]
type = ChangeState
value = 1330
triggerall = command = "QCFb"
triggerall = var(59) = 3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1300
[State -1, Stand Light Punch]
type = ChangeState
value = 1300
triggerall = command = "ZMx"
triggerall = var(59) = 3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1300
[State -1, Stand Light Punch]
type = ChangeState
value = 1310
triggerall = command = "ZMy"
triggerall = var(59) = 3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1280
[State -1, Stand Light Punch]
type = ChangeState
value = 1280
triggerall = command = "HCBx"
triggerall = var(59) = 3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1290
[State -1, Stand Light Punch]
type = ChangeState
value = 1290
triggerall = command = "HCBy"
triggerall = var(59) = 3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1260
[State -1, Stand Light Punch]
type = ChangeState
value = 1260
triggerall = command = "QCFa"
triggerall = var(59) = 3
triggerall = pos y <= -40
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 600 && stateno <= 641

;---------------------------------------------------------------------------
; 1270
[State -1, Stand Light Punch]
type = ChangeState
value = 1270
triggerall = command = "QCFb"
triggerall = var(59) = 3
triggerall = pos y <= -40
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 600 && stateno <= 641

;---------------------------------------------------------------------------
; 1240
[State -1, Stand Light Punch]
type = ChangeState
value = 1240
triggerall = command = "QCBx"
triggerall = var(59) = 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1250
[State -1, Stand Light Punch]
type = ChangeState
value = 1250
triggerall = command = "QCBy"
triggerall = var(59) = 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1225
[State -1, Stand Light Punch]
type = ChangeState
value = 1225
triggerall = command = "QCBa"
triggerall = var(59) = 1
triggerall = pos y <= -40
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 600 && stateno <= 641

;---------------------------------------------------------------------------
; 1235
[State -1, Stand Light Punch]
type = ChangeState
value = 1235
triggerall = command = "QCBb"
triggerall = var(59) = 1
triggerall = pos y <= -40
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 600 && stateno <= 641

;---------------------------------------------------------------------------
; 1220
[State -1, Stand Light Punch]
type = ChangeState
value = 1220
triggerall = command = "QCBa"
triggerall = var(59) = 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1230
[State -1, Stand Light Punch]
type = ChangeState
value = 1230
triggerall = command = "QCBb"
triggerall = var(59) = 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1215
[State -1, Stand Light Punch]
type = ChangeState
value = 1215
triggerall = command = "QCFx" || command = "QCFy"
triggerall = var(59) = 3
triggerall = var(1) = 1
triggerall = pos y <= -40
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 600 && stateno <= 641

;---------------------------------------------------------------------------
; 1200
[State -1, Stand Light Punch]
type = ChangeState
value = 1200
triggerall = command = "QCFx"
triggerall = var(59) = 3
triggerall = var(1) != 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;---------------------------------------------------------------------------
; 1201
[State -1, Stand Light Punch]
type = ChangeState
value = 1201
triggerall = command = "QCFx" || command = "QCFy"
triggerall = var(59) = 3
triggerall = var(1) = 1
triggerall = numprojid(1000) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1210
[State -1, Stand Light Punch]
type = ChangeState
value = 1210
triggerall = command = "QCFy"
triggerall = var(59) = 3
triggerall = var(1) != 1
triggerall = numprojid(1000) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1020
[State -1, Stand Light Punch]
type = ChangeState
value = 1020
triggerall = command = "ZMx"
triggerall = var(59) = 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;---------------------------------------------------------------------------
; 1030
[State -1, Stand Light Punch]
type = ChangeState
value = 1030
triggerall = command = "ZMy"
triggerall = var(59) = 1
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1180
[State -1, Stand Light Punch]
type = ChangeState
value = 1180
triggerall = command = "QCFx"
triggerall = var(59) = 1
triggerall = numprojid(1000) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1190
[State -1, Stand Light Punch]
type = ChangeState
value = 1190
triggerall = command = "QCFy"
triggerall = var(59) = 1
triggerall = numprojid(1000) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1160
[State -1, Stand Light Punch]
type = ChangeState
value = 1160
triggerall = command = "QCBx"
triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1170
[State -1, Stand Light Punch]
type = ChangeState
value = 1170
triggerall = command = "QCBy"
triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1140
[State -1, Stand Light Punch]
type = ChangeState
value = 1140
triggerall = command = "ZMx" && command != "HCFx"
triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1150
[State -1, Stand Light Punch]
type = ChangeState
value = 1150
triggerall = command = "ZMy" && command != "HCFy"
triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1120
[State -1, Stand Light Punch]
type = ChangeState
value = 1120
triggerall = command = "HCFx"
triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1130
[State -1, Stand Light Punch]
type = ChangeState
value = 1130
triggerall = command = "HCFy"
triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1100
[State -1, Stand Light Punch]
type = ChangeState
value = 1100
triggerall = command = "QCBx"
triggerall = var(59) = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1110
[State -1, Stand Light Punch]
type = ChangeState
value = 1110
triggerall = command = "QCBy"
triggerall = var(59) = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1080
[State -1, Stand Light Punch]
type = ChangeState
value = 1080
triggerall = command = "DDx"
triggerall = var(59) = 2
triggerall = pos y <= -40
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 600 && stateno <= 641

;---------------------------------------------------------------------------
; 1090
[State -1, Stand Light Punch]
type = ChangeState
value = 1090
triggerall = command = "DDy"
triggerall = var(59) = 2
triggerall = pos y <= -40
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 600 && stateno <= 641

;---------------------------------------------------------------------------
; 1060
[State -1, Stand Light Punch]
type = ChangeState
value = 1060
triggerall = command = "HCBa"
triggerall = var(59) = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;---------------------------------------------------------------------------
; 1070
[State -1, Stand Light Punch]
type = ChangeState
value = 1070
triggerall = command = "HCBb"
triggerall = var(59) = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1040
[State -1, Stand Light Punch]
type = ChangeState
value = 1040
triggerall = command = "QCFa"
triggerall = var(59) = 2 || var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;---------------------------------------------------------------------------
; 1050
[State -1, Stand Light Punch]
type = ChangeState
value = 1050
triggerall = command = "QCFb"
triggerall = var(59) = 2 || var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240

;---------------------------------------------------------------------------
; 1000
[State -1, Stand Light Punch]
type = ChangeState
value = 1000
triggerall = command = "QCFx" || command = "QCF-x"
triggerall = var(59) = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 = stateno != 240
;---------------------------------------------------------------------------
; 1010
[State -1, Stand Light Punch]
type = ChangeState
value = 1010
triggerall = command = "QCFy" || command = "QCF-y"
triggerall = var(59) = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = movecontact && stateno >= 200 && stateno <= 430
trigger2 =  stateno != 240

;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Down Throw
[State -1, Stand Light Punch]
type = ChangeState
value = 950
triggerall = command = "z" || (command = "a" && command = "x")
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = p2dist X < 60
triggerall = var(59) = 0
triggerall = statetype != A
triggerall = p2statetype = L
trigger1 = ctrl
trigger2 = stateno = 1040 && time >= 8
trigger3 = stateno = 1050 && time >= 12

;---------------------------------------------------------------------------
; Air Throw
[State -1, Jump Light Punch]
type = ChangeState
value = 900
triggerall = command = "z"  || (command = "a" && command = "x")
triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Throw
[State -1, Stand Light Punch]
type = ChangeState
value = 800
triggerall = command = "z"  || (command = "a" && command = "x")
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Back Throw
[State -1, Stand Light Punch]
type = ChangeState
value = 850
triggerall = command = "z"  || (command = "a" && command = "x")
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Charge Cancel
[State -1, Stand Light Punch]
type = ChangeState
value = 750
triggerall = command = "c" || (command = "b" && command = "y")
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = movecontact && stateno >= 200 && stateno <= 440
trigger1 =  stateno != 240
;striker
trigger2 = movecontact
trigger2 = stateno = 1000 || stateno = 1010 || stateno = 1045 || stateno = 1046 || stateno = 1065 || stateno = 1085 || stateno = 1100 || stateno = 1101 || stateno = 1102 || stateno = 1110
;grappler
trigger3 = movecontact
trigger3 = stateno = 951 || stateno = 1145 || stateno = 1150 || stateno = 1160 || stateno = 1166 || stateno = 1170
trigger4 = time >= 2
trigger4 = stateno = 915 || stateno = 1053 || stateno = 1123
;nenmaster
trigger5 = movecontact && statetype = S
trigger5 = stateno = 1020 || stateno = 1030
trigger6 = stateno = 1182 && numprojid(1000) != 0
trigger7 = stateno = 1182 && projcontacttime(1000) != -1 && projcontacttime(1000) <= 20 
trigger8 = time >= 10
trigger8 = stateno = 1240 || stateno = 1250
;streetfighter
trigger9 = movecontact
trigger9 = stateno = 1300 || stateno = 1301 || stateno = 1310 || stateno = 1320 || stateno = 1330
trigger10 = numprojid(1000) != 0
trigger10 = stateno = 1201 || stateno = 1210
trigger11 = stateno = 1282 && time >= 2

;---------------------------------------------------------------------------
; Power Charge
[State -1, Stand Light Punch]
type = ChangeState
value = 700
triggerall = command = "c"
triggerall = power < 5000
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Power Charge
[State -1, Stand Light Punch]
type = ChangeState
value = 705
triggerall = command = "b" && command = "y"
triggerall = power < 5000
trigger1 = statetype != A
trigger1 = ctrl


;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 250
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 260
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno >= 200 && stateno <= 430
trigger2 = stateno != 210 && stateno != 240 && stateno != 250 && stateno != 260

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 211
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = p2dist X < 65
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 231
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = p2dist X < 60
triggerall = p2statetype != A
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 241
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = p2dist X < 80
triggerall = p2statetype != A
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = command = "x"
triggerall = Vel X > 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = Vel X < 1
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = Vel X > 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 611
triggerall = command = "y"
triggerall = Vel X < 1
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = command = "a"
triggerall = Vel X > 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = Vel X < 1
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = Vel X < 1
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 641
triggerall = command = "b"
triggerall = Vel X > 0
trigger1 = statetype = A
trigger1 = ctrl

