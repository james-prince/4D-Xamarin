Class extends _Base
Class constructor($Text : Text; $HorizontalTextAlignment : Integer; $VerticalTextAlignment : Integer)
	Super()
	This.Object.Type:="Label"
	This.Object.Text:=Uppercase($Text)
	This.Object.HorizontalTextAlignment:=\
		Count parameters>=2 ? $HorizontalTextAlignment : Xamarin Text Alignment.Center
	This.VerticalTextAlignment:=\
		Count parameters>=3 ? $VerticalTextAlignment : Xamarin Text Alignment.Center