Class extends _Base
Class constructor($Rows : Integer; $Columns : Integer)
	Super()
	This.Object.Type:="Grid"
	This.Object.ColumnDefinitions:=[]
	This.Object.RowDefinitions:=[]
	This.Object.Children:=[]
	This.Rows:=$Rows
	This.Columns:=$Columns
	
Function get Rows : Integer
	return This.Object.RowDefinitions.length
	
Function set Rows($TargetRows : Integer)
	ASSERT($TargetRows>=0)
	$TargetRows:=$TargetRows>0 ? $TargetRows : 0
	While ($TargetRows<This.Rows)
		This.Object.RowDefinitions.pop()
	End while 
	While ($TargetRows>This.Rows)
		This.addRow()
	End while 
	
Function get Columns : Integer
	return This.Object.ColumnDefinitions.length
	
Function set Columns($TargetColumns : Integer)
	ASSERT($TargetColumns>=0)
	$TargetColumns:=$TargetColumns>0 ? $TargetColumns : 0
	While ($TargetColumns<This.Columns)
		This.Object.ColumnDefinitions.pop()
	End while 
	While ($TargetColumns>This.Columns)
		This.addColumn()
	End while 
	
	
	
Function addChild($Child : Object; $Left : Integer; $Top : Integer; $Right : Integer; $Bottom : Integer)
	var $ChildObject:=$Child.toObject()
	$ChildObject.Left:=$Left
	$ChildObject.Top:=$Top
	$ChildObject.Right:=$Right<$Left ? $Left : $Right
	$ChildObject.Bottom:=$Bottom<$Top ? $Top : $Bottom
	
	This.Object.Children.push($ChildObject)
	
Function addRow($Value : Integer; $IsStar : Boolean)
	$Value:=Count parameters>=1 ? $Value : -1
	$IsStar:=Count parameters>=2 ? $IsStar : True
	This.Object.RowDefinitions.push(This.newGridLength($Value; $IsStar))
	
Function addColumn($Value : Integer; $IsStar : Boolean)
	$Value:=Count parameters>=1 ? $Value : 1
	$IsStar:=Count parameters>=2 ? $IsStar : True
	This.Object.ColumnDefinitions.push(This.newGridLength($Value; $IsStar))
	
	
Function newGridLength($Value : Real; $IsStar : Boolean)->$GridLengthObject : Object
	$GridLengthObject:={Value: $Value}
	Case of 
		: ($Value=-1)
			$GridLengthObject.Value:=0
			$GridLengthObject.GridUnitType:=2
		: ($IsStar)
			$GridLengthObject.GridUnitType:=1
		Else 
			$GridLengthObject.GridUnitType:=0
	End case 