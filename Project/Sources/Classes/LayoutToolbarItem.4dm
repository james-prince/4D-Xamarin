Class constructor($Text : Text; $RestFunctionOrPath : Variant; $RestPostObject : Object)
	var $RestPath:=Xamarin Rest Path($RestFunctionOrPath)
	
	This.Object:={\
		Text: $Text; \
		RestPath: $RestPath; \
		RestPostJson: JSON Stringify($RestPostObject)}
	This.Text:=$Text
	This.RestPath:=$RestPath
	This.RestPostJson:=JSON Stringify($RestPostObject)
	
Function toObject() : Object
	return This.Object
	
Function addConfirmation($Confirmation : cs.Confirmation) : cs.LayoutToolbarItem
	This.Object.Confirmation:=$Confirmation.toObject()
	return This