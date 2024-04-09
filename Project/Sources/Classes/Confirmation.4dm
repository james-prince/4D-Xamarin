Class constructor($Title : Text; $Message : Text; $ConfirmText : Text; $CancelText : Text)
	This.Object:=New object
	This.Object.Title:=$Title
	This.Object.Message:=$Message
	This.Object.ConfirmText:=$ConfirmText || "OK"
	This.Object.CancelText:=$CancelText || "Cancel"
	
Function toObject() : Object
	return This.Object