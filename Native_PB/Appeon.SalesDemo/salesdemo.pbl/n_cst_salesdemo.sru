//objectcomments Sales CRM Demo application manager
forward
global type n_cst_salesdemo from n_cst_appmanager
end type
end forward

global type n_cst_salesdemo from n_cst_appmanager
end type
global n_cst_salesdemo n_cst_salesdemo

on n_cst_salesdemo.create
call super::create
end on

on n_cst_salesdemo.destroy
call super::destroy
end on

event constructor;call super::constructor;// The application information PFC shows in its dialogs and message boxes
iapp_object.DisplayName = gs_msg_title
this.of_SetAppIniFile("Config.ini")
this.of_SetLogo("image\about.png")
this.of_SetCopyright("Copyright © Appeon. All rights reserved.")
end event

event pfc_open;call super::pfc_open;String  ls_theme

//Check Evergreen WebView2 Runtime Installed
If f_chk_webview_installed() = -1 Then
	Return
End If

// of_ApplyTheme also gives the PFC status bar the theme's colors
ls_theme = ProfileString(this.of_GetAppIniFile(), "Theme", "Theme", "Flat Design Blue (HighDPI)")
IF ls_theme <> "Do Not Use Themes" THEN
	this.of_ApplyTheme(GetCurrentDirectory( ) + "\Theme\" + ls_theme)
END IF

this.of_SetError(TRUE)

// The connection settings are in the [Database] section of Config.ini
if SQLCA.of_Init(this.of_GetAppIniFile(), "Database") = -1 then
	messagebox('Information','Connect database fail: ' + this.of_GetAppIniFile() + ' not found.')
	return
end if

if SQLCA.of_Connect() = 0 then
	inv_error.of_SetPredefinedSource(SQLCA)
	Open(w_sales_frame)
else
	messagebox('Information','Connect database fail: '+ sqlca.sqlerrtext)
end if
end event

event pfc_systemerror;// Overrides PFC's handling, which closes the application after the message:
// the demo reports the error and keeps running, as it did before PFC.
Choose Case error.Number
        Case 220  to 229 //Session Error
                 MessageBox ("Session Error", "Number:" + String(error.Number) + "~r~nText:" + error.Text )
        Case 230  to 239 //License Error
                 MessageBox ("License Error", "Number:" + String(error.Number) + "~r~nText:" + error.Text )
        Case 240  to 249 //Token Error
                 MessageBox ("Token Error", "Number:" + String(error.Number) + "~r~nText:" + error.Text )
        Case Else
                 MessageBox ("SystemError", "Number:" + String(error.Number) + "~r~nText:" + error.Text )
End Choose
end event
