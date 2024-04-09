Class extends _Base
Class constructor()
	Super()
	This.Object.Type:="StackLayout"
	This.Object.Children:=New collection
	
Function addChild($Child : Object)
	This.Object.Children.push($Child.toObject())