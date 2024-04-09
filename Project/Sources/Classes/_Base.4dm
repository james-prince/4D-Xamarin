property Object : Object

Class constructor()
	This.Object:={}
	
Function toObject() : Object
	return This.Object
	
Function setFontStyle($FontSize : Real; $Bold : Boolean) : cs._Xamarin_Base
	This.Object.FontSize:=$FontSize
	This.Object.Bold:=$Bold
	return This
	
Function setBackgroundColour($Colour : Integer) : cs._Xamarin_Base
	This.Object.BackgroundColour:=$Colour
	return This
	
Function setForegroundColour($Colour : Integer) : cs._Xamarin_Base
	This.Object.ForegroundColour:=$Colour
	return This
	
Function setMargin($Left : Integer; $Top : Integer; $Right : Integer; $Bottom : Integer) : cs._Xamarin_Base
	$Left:=Count parameters>=1 ? $Left : 0
	$Top:=Count parameters>=2 ? $Top : $Left
	$Right:=Count parameters>=3 ? $Right : $Left
	$Bottom:=Count parameters>=4 ? $Bottom : $Top
	
	This.Object.Margin:={\
		Left: $Left; \
		Top: $Top; \
		Right: $Right; \
		Bottom: $Bottom}
	return This
	
Function setPadding($Left : Integer; $Top : Integer; $Right : Integer; $Bottom : Integer) : cs._Xamarin_Base
	$Left:=Count parameters>=1 ? $Left : 0
	$Top:=Count parameters>=2 ? $Top : $Left
	$Right:=Count parameters>=3 ? $Right : $Left
	$Bottom:=Count parameters>=4 ? $Bottom : $Top
	
	This.Object.Padding:={\
		Left: $Left; \
		Top: $Top; \
		Right: $Right; \
		Bottom: $Bottom}
	return This