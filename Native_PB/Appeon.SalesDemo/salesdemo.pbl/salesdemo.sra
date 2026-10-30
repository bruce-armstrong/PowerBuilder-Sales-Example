//objectcomments Generated Application Object
forward
global type salesdemo from application
end type
global n_tr sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global n_err error
global n_msg message
end forward

global variables
// PFC application manager
n_cst_salesdemo gnv_app

String gs_msg_title = "Sales CRM Demo"




end variables

global type salesdemo from application
string appname = "salesdemo"
string displayname = "SalesDemo"

string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 25.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = ".\image\CRM.ico"
string appruntimeversion = "25.1.0.6430"
boolean manualsession = false
boolean unsupportedapierror = true
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
end type
global salesdemo salesdemo

on salesdemo.create
appname="salesdemo"
message=create n_msg
sqlca=create n_tr
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create n_err
end on

on salesdemo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Redirect the open message to the application manager
gnv_app = CREATE n_cst_salesdemo
gnv_app.Event pfc_open(CommandParm())
end event

event close;gnv_app.Event pfc_close()
DESTROY gnv_app
end event

event systemerror;gnv_app.Event pfc_systemerror()
end event

event idle;gnv_app.Event pfc_idle()
end event

