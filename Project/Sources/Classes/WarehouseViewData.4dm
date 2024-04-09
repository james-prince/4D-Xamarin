Class constructor($PageTitle : Text)
	This.Object:={\
		PageTitle: (Uppercase($PageTitle) || Null); \
		LayoutElements: []; \
		LayoutToolbarItems: []; \
		Reload: False}
	
	
Function toObject()->$Object : Object
	return This.Object
	
	
Function addLayoutElement($LayoutElementObject : Object) : cs.WarehouseViewData
	This.Object.LayoutElements.push($LayoutElementObject.toObject())
	return This
	
	
Function addLayoutToolbarItems($LayoutToolbarItem : cs.LayoutToolbarItem) : cs.WarehouseViewData
	This.Object.LayoutToolbarItems.push($LayoutToolbarItem.toObject())
	return This
	
	
Function addLayoutToolbarItem($LayoutToolbarItem : cs.LayoutToolbarItem) : cs.WarehouseViewData
	This.Object.LayoutToolbarItems.push($LayoutToolbarItem.toObject())
	return This
	
	
Function displayAlert($Title : Text; $Text : Text; $CancelText : Text) : cs.WarehouseViewData
	This.Object.Alert:={\
		Title: $Title; \
		Text: $Text; \
		CancelText: ($CancelText || "OK")}
	return This
	
	
Function vibratePositive() : cs.WarehouseViewData
	return This.vibrate(80)
	
	
Function vibrateNegative() : cs.WarehouseViewData
	return This.vibrate(800)
	
	
Function vibrateAttention() : cs.WarehouseViewData
	return This.vibratePattern(\
		New collection(180; 180; 180; 180; 180))
	
	
Function vibratePattern($DurationCollection : Collection) : cs.WarehouseViewData
	This.Object.Vibrate:=New object("Pattern"; $DurationCollection)
	return This
	
Function vibrate($DurationMs : Real) : cs.WarehouseViewData
	If ($DurationMs>=0) && ($DurationMs<=5000)
		var $VibateObject : Object
		$VibateObject:=New object
		$VibateObject.Duration:=$DurationMs
		This.Object.Vibrate:=$VibateObject
	End if 
	return This
	
Function enableScanner($RestFunctionOrPath : Variant; $RestPostObject : Object) : cs.WarehouseViewData
	var $RestPath:=Xamarin Rest Path($RestFunctionOrPath)
	
	This.Object.Scanner:={\
		RestPath: $RestPath; \
		RestPostJson: (Count parameters>=2 ? JSON Stringify($RestPostObject) : Null)}
	return This
	
Function displayPrompt($RestFunctionOrPath : Variant; $RestPostObject : Object; \
$Title : Text; $Text : Text; $AcceptText : Text; $CancelText : Text; \
$NumericKeyboard : Boolean; $PlaceHolder : Text; $InitialValue : Text) : cs.WarehouseViewData
	var $RestPath:=Xamarin Rest Path($RestFunctionOrPath)
	
	This.Object.Prompt:={\
		Title: $Title; \
		Text: $Text; \
		AcceptText: $AcceptText; \
		CancelText: $CancelText; \
		NumericKeyboard: $NumericKeyboard; \
		PlaceHolder: $PlaceHolder; \
		InitialValue: $InitialValue; \
		RestPostJson: ($RestPostObject=Null ? Null : JSON Stringify($RestPostObject)); \
		RestPath: $RestPath}
	return This
	
	
Function addHistory($RestFunctionOrPath : Variant; $RestPostDataObject : Object) : cs.WarehouseViewData
	var $RestPath : Text
	$RestPath:=Xamarin Rest Path(Count parameters>=1 ? $RestFunctionOrPath : "")
	
	This.Object.History:={\
		RestPath: $RestPath; \
		RestPostData: (Count parameters>=2 ? $RestPostDataObject : Null)}
	return This
	
	
Function setRedirect($RestFunctionOrPath : Variant; $RestPostDataObject : Object) : cs.WarehouseViewData
	var $RestPath : Text
	$RestPath:=Xamarin Rest Path($RestFunctionOrPath)
	
	This.Object.RedirectPostRequest:={\
		RestPath: $RestPath; \
		RestPostData: (Count parameters>=2 ? $RestPostDataObject : Null)}
	return This
	
	
Function confirm($Title : Text; $Text : Text; $AcceptText : Text; $AcceptFunctionOrPath : Variant; $CancelText : Text; $CancelFunctionOrPath : Variant)\
 : cs.WarehouseViewData
	
	var $AcceptPath:=Xamarin Rest Path($AcceptFunctionOrPath)
	var $CancelPath:=Xamarin Rest Path($CancelFunctionOrPath || "")
	
	This.Object.Confirm:={\
		Title: Uppercase($Title); \
		Text: Uppercase($Text); \
		AcceptText: Uppercase($AcceptText); \
		AcceptPath: $AcceptPath; \
		CancelText: (Uppercase($CancelText) || Null); \
		CancelPath: ($CancelPath || "")}
	return This
	
	
Function reload($Reload : Boolean) : cs.WarehouseViewData
	This.Object.Reload:=Count parameters=0 ? True : $Reload
	return This