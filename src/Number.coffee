_Number = Number.prototype

_Number.times   = (fn) ->
    fn(i) for i in [0...@valueOf()]


_Number.odd = ->
    @valueOf() % 2 != 0


_Number.multiple_of =
_Number.multipleOf  = (n) ->
    @valueOf() % n == 0


_Number.divider_of =
_Number.dividerOf  = (n) ->
    n % @valueOf() == 0


# Date functions

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
    Date.now().milli_to_sec() - @valueOf()


_Number.from_now =
_Number.fromNow  = ->
    Date.now().milli_to_sec() + @valueOf()


_Number.to_d    =
_Number.to_date =
_Number.toDate  = ->
    new Date @valueOf().sec_to_milli()


_Number.days_in_month =
_Number.daysInMonth   = ->
	date = new Date()
	new Date(date.getFullYear(), @valueOf() + 1, 0).getDate()


_Number.days_in_month_of =
_Number.daysInMonthOf    = (year) ->
    new Date(year, @valueOf() + 1, 0).getDate()


_Number.month_name =
_Number.monthName  = (lang) ->
    lang = lang or 'en'
    Date.locale[lang] && Date.locale[lang].month_names[@valueOf()]

_Number.short_month_name =
_Number.shortMonthName   = (lang) ->
    lang = lang or 'en'
    Date.locale[lang] && Date.locale[lang].month_names_short[@valueOf()]


_Number.day_name =
_Number.dayName  = (lang) ->
    lang = lang or 'en'
    Date.locale[lang] && Date.locale[lang].day_names[@valueOf()]

_Number.short_day_name =
_Number.shortDayName  = (lang) ->
    lang = lang or 'en'
    Date.locale[lang] && Date.locale[lang].day_names_short[@valueOf()]


_Number.milli_to_sec =
_Number.milliToSeconds  = ->
    parseInt @valueOf() / 1000


_Number.sec_to_milli =
_Number.secToMilli  = ->
    @valueOf() * 1000
