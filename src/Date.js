// Generated by CoffeeScript 1.3.3
(function() {
  var _Date;

  _Date = Date.prototype;

  _Date.weekend = _Date.is_weekend = _Date.isWeekend = function() {
    var _ref;
    return (_ref = this.getDay()) === 0 || _ref === 6;
  };

  _Date.days_in_month = _Date.daysInMonth = function() {
    return new Date(this.getFullYear(), this.getMonth() + 1, 0).getDate();
  };

  _Date.advance = function(seconds) {
    return new Date(this.getTime() + seconds.sec_to_milli());
  };

  _Date.reduce = function(seconds) {
    return new Date(this.getTime() - seconds.sec_to_milli());
  };

  _Date.tomorrow = function() {
    return this.advance(1..day());
  };

  _Date.yesterday = function() {
    return this.reduce(1..day());
  };

  _Date.next_month = _Date.nextMonth = function() {
    return this.advance(this.daysInMonth().days());
  };

  _Date.last_month = _Date.lastMonth = function() {
    return this.reduce(this.daysInMonth(this.getMonth() - 1).days());
  };

  _Date.next_year = _Date.nextYear = function() {
    if (this.isLeapYear()) {
      if (this.getMonth() > 1) {
        return this.advance(365..days());
      } else {
        return this.advance(366..days());
      }
    } else {
      return this.advance(365..days());
    }
  };

  _Date.last_year = _Date.lastYear = function() {
    if (this.isLeapYear()) {
      if (this.getMonth() <= 1) {
        return this.reduce(365..days());
      } else {
        return this.reduce(366..days());
      }
    } else {
      return this.reduce(365..days());
    }
  };

  _Date.is_leap_year = _Date.leap_year = _Date.leapYear = _Date.isLeapYear = function(year) {
    if (!year) {
      year = this.getFullYear();
    }
    return 1..daysInMonthOf(year) === 29;
  };

  _Date.days_in_year = _Date.daysInYear = function() {
    if (this.leap_year()) {
      return 366;
    } else {
      return 365;
    }
  };

  _Date.daysInMonth = function(month) {
    if (month === void 0) {
      month = this.getMonth();
    }
    return new Date(this.getFullYear(), month + 1, 0).getDate();
  };

  _Date.diff = function(date) {
    return parseInt((this - date).toSeconds());
  };

}).call(this);