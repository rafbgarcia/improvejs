describe 'Number', ->
    describe '#times', ->
        it 'loops according to the integer', ->
            text = ''
            3.times (i) ->
                text += i
            expect(text).toEqual '012'

    describe '#minutes', ->
        it 'should return n minutes in seconds ', ->
            expect(12.minutes()).toEqual 60*12
            expect(1.minute()).toEqual   60*1

    describe '#hours', ->
        it 'should return n hours in seconds ', ->
            expect(3.hours()).toEqual 60.minutes() * 3
            expect(1.hour()).toEqual  60.minutes()

    describe '#days', ->
        it 'should return n days in seconds ', ->
            expect(30.days()).toEqual 24.hours() * 30
            expect(1.day()).toEqual   24.hours()
            expect(5.days()).toEqual  24.hours() * 5

    describe '#weeks', ->
        it 'should return n weeks in seconds ', ->
            expect(1.week()).toEqual(7.days())

    describe '#ago', ->
        it 'should return the time ago in seconds', ->
            expect(30.days().ago()).toEqual     Date.now().milli_to_sec() - 30.days()
            expect(1.hour().ago()).toEqual      Date.now().milli_to_sec() - 1.hour()
            expect(32.minutes().ago()).toEqual  Date.now().milli_to_sec() - 32.minutes()

    describe '#fromNow', ->
        it 'should return the time from now in seconds', ->
            expect(30.days().fromNow()).toEqual    Date.now().milli_to_sec() + 30.days()
            expect(1.day().from_now()).toEqual     Date.now().milli_to_sec() + 1.day()
            expect(3.minutes().from_now()).toEqual Date.now().milli_to_sec() + 3.minutes()

    describe '#toDate', ->
        it 'should return a new Date object', ->
            expect(30.days().ago().toDate()).toHaveBeenCalledWith instanceof Date
            expect(1.day().ago().to_d()).toHaveBeenCalledWith     instanceof Date

    describe '#daysInMonth', ->
        it 'should return the number of days in month of the current year', ->
            expect(11.daysInMonth()).toEqual 31
            expect(10.daysInMonth()).toEqual 30
            expect(9.daysInMonth()).toEqual 31
            expect(8.daysInMonth()).toEqual 30
            expect(7.daysInMonth()).toEqual 31
            expect(6.daysInMonth()).toEqual 31
            expect(5.daysInMonth()).toEqual 30
            expect(4.daysInMonth()).toEqual 31
            expect(3.daysInMonth()).toEqual 30
            expect(2.daysInMonth()).toEqual 31
            expect(1.daysInMonth()).toEqual 29
            expect(0.days_in_month()).toEqual 31

    describe '#daysInMonthOf', ->
        it 'should return the number of days in month of the given month', ->
            expect(11.daysInMonthOf(2011)).toEqual 31
            expect(10.daysInMonthOf(2011)).toEqual 30
            expect(9.daysInMonthOf(2011)).toEqual 31
            expect(8.daysInMonthOf(2011)).toEqual 30
            expect(7.daysInMonthOf(2011)).toEqual 31
            expect(6.daysInMonthOf(2011)).toEqual 31
            expect(5.daysInMonthOf(2011)).toEqual 30
            expect(4.daysInMonthOf(2011)).toEqual 31
            expect(3.daysInMonthOf(2011)).toEqual 30
            expect(2.daysInMonthOf(2011)).toEqual 31
            expect(1.daysInMonthOf(2011)).toEqual 28
            expect(0.days_in_month_of(2011)).toEqual 31

    describe '#odd', ->
        it 'returns true if number is odd', ->
            expect(3.odd()).toEqual true
            expect(2.odd()).toEqual false

    describe '#multiple', ->
        it 'returns true if number is multiple of n', ->
            expect(9.multipleOf(3)).toEqual true
            expect(12.multipleOf(2)).toEqual true
            expect(2.multipleOf(5)).toEqual false
            expect(3.multipleOf(9)).toEqual false

    describe '#dividerOf', ->
        it 'returns true if number is divider of n', ->
            expect(3.dividerOf(9)).toEqual true
            expect(2.dividerOf(8)).toEqual true
            expect(10.dividerOf(5)).toEqual false
            expect(9.dividerOf(3)).toEqual false

    describe '#monthName', ->
        it 'returns the month name', ->
            expect(0.monthName()).toEqual 'January'
            expect(11.monthName()).toEqual 'December'
            expect(0.monthName('pt_br')).toEqual 'Janeiro'
            expect(11.monthName('pt_br')).toEqual 'Dezembro'

    describe '#shortMonthName', ->
        it 'returns the short month name', ->
            expect(0.shortMonthName()).toEqual 'Jan'
            expect(11.shortMonthName()).toEqual 'Dec'
            expect(0.shortMonthName('pt_br')).toEqual 'Jan'
            expect(11.shortMonthName('pt_br')).toEqual 'Dez'

    describe '#dayName', ->
        it 'returns the day name', ->
            expect(0.dayName()).toEqual 'Sunday'
            expect(6.dayName()).toEqual 'Saturday'

    describe '#shortDayName', ->
        it 'returns the short Day name', ->
            expect(0.shortDayName()).toEqual 'Sun'
            expect(6.shortDayName()).toEqual 'Sat'
