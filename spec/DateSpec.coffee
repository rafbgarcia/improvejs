describe 'Date', ->

    describe '#isWeekend', ->
        it 'checks if is weekend', ->
            date = new Date(2012, 11 , 8)
            expect(date.isWeekend()).toBeTruthy()
            date = new Date(2012, 11, 7)
            expect(date.is_weekend()).not.toBeTruthy()
            expect(date.weekend()).not.toBeTruthy()

    describe '#advance', ->
        it 'returns advanced time', ->
            date = new Date(2012, 11, 8)
            _date = new Date(2012, 11, 9)
            _date2 = new Date(2013, 0, 8)

            expect(date.advance 1.day() ).toEqual(_date)
            expect(date.advance 12.daysInMonth().days() ).toEqual(_date2)
            expect(date.advance 31.days() ).toEqual(_date2)

    describe '#reduce', ->
        it 'returns reduced time', ->
            date = new Date(2012, 11, 8)
            _date = new Date(2012, 10, 8)

            expect(date.reduce 10.days_in_month().days() ).toEqual(_date)

    describe '#tomorrow', ->
        it 'returns next day', ->
            date = new Date(2012, 11 , 8)
            _date = new Date(2012, 11 , 9)
            expect(date.tomorrow()).toEqual(_date)

    describe '#yesterday', ->
        it 'returns previous day', ->
            date = new Date(2012, 11 , 8)
            _date = new Date(2012, 11 , 7)
            expect(date.yesterday()).toEqual(_date)

    describe '#nextMonth', ->
        it 'returns next month', ->
            date = new Date(2012, 11 , 8)
            _date = new Date(2013, 0 , 8)
            expect(date.nextMonth()).toEqual(_date)

    describe '#lastMonth', ->
        it 'returns last month', ->
            date = new Date(2012, 11 , 8)
            _date = new Date(2012, 10 , 8)
            expect(date.lastMonth()).toEqual(_date)

    describe '#isLeapYear', ->
        it 'checks if is leap year', ->
            date = new Date(2012, 11 , 8)
            _date = new Date(2011, 11 , 8)
            expect(date.isLeapYear()).toBeTruthy()
            expect(_date.isLeapYear()).not.toBeTruthy()

    describe '#nextYear', ->
        it 'returns next year', ->
            date = new Date(2012, 11 , 8)
            _date = new Date(2013, 11 , 8)
            _date2 = new Date(2012, 0 , 8)
            _date3 = new Date(2013, 0 , 8)
            expect(_date2.nextYear()).toEqual(_date3)

    describe '#lastYear', ->
        it 'returns last year', ->
            date = new Date(2012, 11 , 8)
            _date = new Date(2011, 11 , 8)
            _date2 = new Date(2011, 0 , 8)
            _date3 = new Date(2010, 0 , 8)
            expect(date.lastYear()).toEqual(_date)
            expect(_date2.lastYear()).toEqual(_date3)


    describe '#daysInMonth', ->
        it 'returns the number of days of current date', ->
            date = new Date(2012, 11, 8)
            expect(date.daysInMonth()).toEqual 31
            date = new Date(2012, 1, 8)
            expect(date.daysInMonth()).toEqual 29


    describe '#daysInYear', ->
        it 'returns the number of days in current year', ->
            date = new Date(2012, 3, 8)
            _date = new Date(2010, 3, 8)
            expect(date.daysInYear()).toEqual 366
            expect(_date.daysInYear()).toEqual 365



