_Date = Date.prototype

_Date.weekend    =
_Date.is_weekend =
_Date.isWeekend  = ->
    @getDay() in [0, 6]


_Date.days_in_month =
_Date.daysInMonth   = ->
    new Date(@getFullYear(), @getMonth()+1, 0).getDate()


_Date.advance = (seconds) ->
    new Date @getTime() + seconds.toTimestamp()


_Date.reduce = (seconds) ->
    new Date @getTime() - seconds.toTimestamp()


_Date.tomorrow = ->
    @advance 1.day()


_Date.yesterday = ->
    @reduce 1.day()

_Date.next_month =
_Date.nextMonth  = ->
    @advance @daysInMonth().days()


_Date.last_month =
_Date.lastMonth  = ->
    @reduce @daysInMonth(@getMonth() - 1).days()


_Date.next_year =
_Date.nextYear  = ->
    if @isLeapYear()
        if @getMonth() > 1 then @advance 365.days() else @advance 366.days()
    else
        @advance 365.days()



_Date.last_year =
_Date.lastYear  = ->
    if @isLeapYear()
        if @getMonth() <= 1 then @reduce 365.days() else @reduce 366.days()
    else
        @reduce 365.days()


_Date.is_leap_year =
_Date.leap_year    =
_Date.leapYear     =
_Date.isLeapYear   = (year) ->
    year = @getFullYear() unless year
    1.daysInMonthOf(year) == 29


_Date.days_in_year =
_Date.daysInYear   = ->
    if @leap_year() then 366 else 365


_Date.daysInMonth = (month) ->
    month = @getMonth() if month is undefined
    new Date(@getFullYear(), month + 1, 0).getDate()


# Return the difference between 2 dates in seconds
_Date.diff = (date) ->
    parseInt (@ - date).toSeconds()
