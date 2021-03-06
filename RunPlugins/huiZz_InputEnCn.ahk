﻿;*******************************
;* 【自定义程序自动中英输入法】*
;*                   by hui-Zz *
;*******************************
global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon             ;~不显示托盘图标
#Persistent             ;~让脚本持久运行
#SingleInstance,Force   ;~运行替换旧实例
;~ DetectHiddenWindows,on	;~显示隐藏窗口(匹配负作用)
;-----------------------------------------------------------
;[切换中文输入法的程序，复制一行后修改QQ.exe]
GroupAdd,cnApp,ahk_exe QQ.exe

;[切换英文输入法的程序，复制一行后修改cmd.exe]
GroupAdd,enApp,ahk_exe cmd.exe

~LButton::
	Sleep,200
	if(WinActive("ahk_group cnApp")){
		;切换Win10输入法为中文
		DllCall("SendMessage",UInt,DllCall("imm32\ImmGetDefaultIMEWnd",Uint,WinExist("A")),UInt,0x0283,Int,0x002,Int,0x01)
		IME_SET(1)
	}else if(WinActive("ahk_group enApp")){
		;切换Win10输入法为英文
		DllCall("SendMessage",UInt,DllCall("imm32\ImmGetDefaultIMEWnd",Uint,WinExist("A")),UInt,0x0283,Int,0x002,Int,0x00)
		IME_SET(0)
	}
return

IME_SET(setSts, WinTitle="")
;-----------------------------------------------------------
; IMEの状態をセット
;    対象： AHK v1.0.34以降
;   SetSts  : 1:ON 0:OFF
;   WinTitle: 対象Window (省略時:アクティブウィンドウ)
;   戻り値  1:ON 0:OFF
;-----------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
 
    ;Message : WM_IME_CONTROL  wParam:IMC_SETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x006,setSts,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}