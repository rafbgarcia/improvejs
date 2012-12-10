// Generated by CoffeeScript 1.3.3
(function() {

  describe('Number', function() {
    describe('#times', function() {
      return it('loops according to the integer', function() {
        var text;
        text = '';
        3..times(function(i) {
          return text += i;
        });
        return expect(text).toEqual('012');
      });
    });
    describe('#minutes', function() {
      return it('should return n minutes in seconds ', function() {
        expect(12..minutes()).toEqual(60 * 12);
        return expect(1..minute()).toEqual(60 * 1);
      });
    });
    describe('#hours', function() {
      return it('should return n hours in seconds ', function() {
        expect(3..hours()).toEqual(60..minutes() * 3);
        return expect(1..hour()).toEqual(60..minutes());
      });
    });
    describe('#days', function() {
      return it('should return n days in seconds ', function() {
        expect(30..days()).toEqual(24..hours() * 30);
        expect(1..day()).toEqual(24..hours());
        return expect(5..days()).toEqual(24..hours() * 5);
      });
    });
    describe('#weeks', function() {
      return it('should return n weeks in seconds ', function() {
        return expect(1..week()).toEqual(7..days());
      });
    });
    describe('#ago', function() {
      return it('should return the time ago in seconds', function() {
        expect(30..days().ago()).toEqual(Date.now().milli_to_sec() - 30..days());
        expect(1..hour().ago()).toEqual(Date.now().milli_to_sec() - 1..hour());
        return expect(32..minutes().ago()).toEqual(Date.now().milli_to_sec() - 32..minutes());
      });
    });
    describe('#fromNow', function() {
      return it('should return the time from now in seconds', function() {
        expect(30..days().fromNow()).toEqual(Date.now().milli_to_sec() + 30..days());
        expect(1..day().from_now()).toEqual(Date.now().milli_to_sec() + 1..day());
        return expect(3..minutes().from_now()).toEqual(Date.now().milli_to_sec() + 3..minutes());
      });
    });
    describe('#toDate', function() {
      return it('should return a new Date object', function() {
        expect(30..days().ago().toDate()).toHaveBeenCalledWith instanceof Date;
        return expect(1..day().ago().to_d()).toHaveBeenCalledWith instanceof Date;
      });
    });
    describe('#daysInMonth', function() {
      return it('should return the number of days in month of the current year', function() {
        expect(11..daysInMonth()).toEqual(31);
        expect(10..daysInMonth()).toEqual(30);
        expect(9..daysInMonth()).toEqual(31);
        expect(8..daysInMonth()).toEqual(30);
        expect(7..daysInMonth()).toEqual(31);
        expect(6..daysInMonth()).toEqual(31);
        expect(5..daysInMonth()).toEqual(30);
        expect(4..daysInMonth()).toEqual(31);
        expect(3..daysInMonth()).toEqual(30);
        expect(2..daysInMonth()).toEqual(31);
        expect(1..daysInMonth()).toEqual(29);
        return expect(0..days_in_month()).toEqual(31);
      });
    });
    describe('#daysInMonthOf', function() {
      return it('should return the number of days in month of the given month', function() {
        expect(11..daysInMonthOf(2011)).toEqual(31);
        expect(10..daysInMonthOf(2011)).toEqual(30);
        expect(9..daysInMonthOf(2011)).toEqual(31);
        expect(8..daysInMonthOf(2011)).toEqual(30);
        expect(7..daysInMonthOf(2011)).toEqual(31);
        expect(6..daysInMonthOf(2011)).toEqual(31);
        expect(5..daysInMonthOf(2011)).toEqual(30);
        expect(4..daysInMonthOf(2011)).toEqual(31);
        expect(3..daysInMonthOf(2011)).toEqual(30);
        expect(2..daysInMonthOf(2011)).toEqual(31);
        expect(1..daysInMonthOf(2011)).toEqual(28);
        return expect(0..days_in_month_of(2011)).toEqual(31);
      });
    });
    describe('#odd', function() {
      return it('returns true if number is odd', function() {
        expect(3..odd()).toEqual(true);
        return expect(2..odd()).toEqual(false);
      });
    });
    describe('#multiple', function() {
      return it('returns true if number is multiple of n', function() {
        expect(9..multipleOf(3)).toEqual(true);
        expect(12..multipleOf(2)).toEqual(true);
        expect(2..multipleOf(5)).toEqual(false);
        return expect(3..multipleOf(9)).toEqual(false);
      });
    });
    describe('#dividerOf', function() {
      return it('returns true if number is divider of n', function() {
        expect(3..dividerOf(9)).toEqual(true);
        expect(2..dividerOf(8)).toEqual(true);
        expect(10..dividerOf(5)).toEqual(false);
        return expect(9..dividerOf(3)).toEqual(false);
      });
    });
    describe('#monthName', function() {
      return it('returns the month name', function() {
        expect(0..monthName()).toEqual('January');
        expect(11..monthName()).toEqual('December');
        expect(0..monthName('pt_br')).toEqual('Janeiro');
        return expect(11..monthName('pt_br')).toEqual('Dezembro');
      });
    });
    describe('#shortMonthName', function() {
      return it('returns the short month name', function() {
        expect(0..shortMonthName()).toEqual('Jan');
        expect(11..shortMonthName()).toEqual('Dec');
        expect(0..shortMonthName('pt_br')).toEqual('Jan');
        return expect(11..shortMonthName('pt_br')).toEqual('Dez');
      });
    });
    describe('#dayName', function() {
      return it('returns the day name', function() {
        expect(0..dayName()).toEqual('Sunday');
        return expect(6..dayName()).toEqual('Saturday');
      });
    });
    return describe('#shortDayName', function() {
      return it('returns the short Day name', function() {
        expect(0..shortDayName()).toEqual('Sun');
        return expect(6..shortDayName()).toEqual('Sat');
      });
    });
  });

}).call(this);
