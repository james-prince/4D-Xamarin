//%attributes = {"shared":true,"preemptive":"capable"}
#DECLARE($RestFunctionOrPath : Variant) : Text

Case of 
	: (Value type($RestFunctionOrPath)=Is text)
	: (Value type($RestFunctionOrPath)=Is object) && (OB Instance of($RestFunctionOrPath; 4D.Function))
	Else 
		throw(-1; JSON Stringify({Parameters: Copy parameters}))
End case 

return Value type($RestFunctionOrPath)=Is text\
 ? $RestFunctionOrPath\
 : ($RestFunctionOrPath.__functionClassName || $RestFunctionOrPath.__remoteClassName)+"/"+($RestFunctionOrPath.__functionName || $RestFunctionOrPath.__remoteID)