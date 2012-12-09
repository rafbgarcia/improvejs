_Number = Number.prototype

# Loops n times
_Number.times   = (fn) ->
    fn(i) for i in [0...@valueOf()]


_Number.min     =
_Number.mins    =
_Number.minute  =
_Number.minutes = ->
    @valueOf() * 60


_Number.hour  =
_Number.hours = ->
    @valueOf() * 60.minutes()


_Number.day  =
_Number.days = ->
    @valueOf() * 24.hours()


_Number.week  =
_Number.weeks = ->
    @valueOf() * 7.days()


_Number.ago = ->
    Date.now().to_seconds() - @valueOf()


_Number.to_seconds =
_Number.toSeconds  = ->
	parseInt @valueOf() / 1000


_Number.to_timestamp =
_Number.toTimestamp  = ->
	parseInt @valueOf() * 1000


_Number.from_now =
_Number.fromNow  = ->
    Date.now().to_seconds() + @valueOf()


_Number.to_d    =
_Number.to_date =
_Number.toDate  = ->
    new Date @valueOf().to_timestamp()


_Number.days_in_month =
_Number.daysInMonth   = ->
	date = new Date()
	new Date(date.getFullYear(), @valueOf() + 1, 0).getDate()


_Number.days_in_month_of =
_Number.daysInMonthOf    = (year) ->
	new Date(year, @valueOf() + 1, 0).getDate()

_Number.odd = ->
    @valueOf() % 2 != 0

_Number.multiple       =
_Number.is_multiple_if =
_Number.isMultipleOf   = (n) ->
    n % @valueOf() == 0
