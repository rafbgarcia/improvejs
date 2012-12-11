_String = String.prototype

_String.upcase   = ->
	@valueOf().toUpperCase()

_String.downcase = @toLowerCase
