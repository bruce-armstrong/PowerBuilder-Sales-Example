forward
global type u_button from u_cb
end type
end forward

global type u_button from u_cb
integer width = 329
integer height = 108
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type
global u_button u_button

on u_button.create
call super::create
end on

on u_button.destroy
call super::destroy
end on

