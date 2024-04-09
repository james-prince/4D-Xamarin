Class extends _Base
Class constructor($Text : Text; $RestFunctionOrPath : Variant; $RestPostObject : Object)
	Super()
	
	var $RestPath:=Xamarin Rest Path($RestFunctionOrPath)
	
	This.Object.Type:="Button"
	This.Object.Text:=$Text
	This.Object.RestPath:=$RestPath
	This.Object.RestPostJson:=Count parameters>=3 ? JSON Stringify($RestPostObject) : Null
	
Function addConfirmation($Title : Text; $Message : Text; $ConfirmText : Text; $CancelText : Text) : cs.Button
	This.Object.Confirmation:={\
		Title: Uppercase($Title); \
		Message: Uppercase($Message); \
		ConfirmText: Uppercase($ConfirmText) || "OK"; \
		CancelText: Uppercase($CancelText) || "Cancel"}
	return This