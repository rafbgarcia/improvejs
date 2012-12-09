// Generated by CoffeeScript 1.3.3
(function() {
  var _Array, _Date, _Function, _Number;

  _Array = Array.prototype;

  _Array.each = function(fn) {
    var i, value, _i, _len, _results;
    _results = [];
    for (i = _i = 0, _len = this.length; _i < _len; i = ++_i) {
      value = this[i];
      _results.push(fn(value, i));
    }
    return _results;
  };

  _Array.include = function(val) {
    if (this.indexOf(val) !== -1) {
      return true;
    } else {
      return false;
    }
  };

  _Array.at = function(from, to) {
    var newArr, swap;
    if (from == null) {
      throw new TypeError('argument "from" must be specified');
    }
    if (to == null) {
      if (from >= 0) {
        return this[from];
      } else {
        return this[this.length - Math.abs(from)];
      }
    }
    newArr = [];
    swap = function() {
      var s;
      s = from;
      from = to;
      return to = s;
    };
    if (from >= 0 && to >= 0) {
      if (from > to) {
        swap();
      }
      newArr = this.filter(function(el, i) {
        return (from <= i && i <= to);
      });
    } else if (from >= 0 && to < 0) {
      to = Math.abs(to);
      newArr = this.filter(function(el, i, arr) {
        return i <= from || i >= (arr.length - to);
      });
    } else if (from < 0 && to < 0) {
      from = Math.abs(from);
      to = Math.abs(to);
      if (to > from) {
        swap();
      }
      newArr = this.filter(function(el, i, arr) {
        return ((arr.length - from) <= i && i <= (arr.length - to));
      });
    } else {
      from = Math.abs(from);
      newArr = this.filter(function(el, i, arr) {
        return i <= to || i >= (arr.length - from);
      });
    }
    return newArr;
  };

  _Array.to = function(to) {
    return this.at(0, to);
  };

  _Array.from = function(from) {
    return this.at(from, this.length);
  };

  _Array.compact = function() {
    var newArr;
    newArr = this.filter(function(el) {
      return (el != null) && el.trim();
    });
    return newArr;
  };

  _Array.count_if = function(callback) {
    var newArr;
    newArr = this.filter(function(el, i, arr) {
      return callback(el, i, arr);
    });
    return newArr.length;
  };

  _Array.min = function() {
    return this.reduce(function(previous, current) {
      previous = parseInt(previous, 10);
      current = parseInt(current, 10);
      if (previous < current) {
        return previous;
      } else {
        return current;
      }
    });
  };

  _Array.max = function() {
    return this.reduce(function(previous, current) {
      previous = parseInt(previous, 10);
      current = parseInt(current, 10);
      if (previous > current) {
        return previous;
      } else {
        return current;
      }
    });
  };

  _Array.sum = function() {
    return this.reduce(function(previous, current) {
      return previous + current;
    });
  };

  _Array.sum_if = function(fn) {
    var newArr;
    newArr = this.filter(function(val, i, arr) {
      return fn(val, i, arr);
    });
    return newArr.sum();
  };

  _Array.multiply = function() {
    return this.reduce(function(previous, current) {
      return previous * current;
    });
  };

  _Array.uniq = _Array.unique = function(where) {
    var i, newArr, _i, _len;
    newArr = [];
    for (_i = 0, _len = this.length; _i < _len; _i++) {
      i = this[_i];
      if (!newArr.include(i)) {
        newArr.push(i);
      }
    }
    return newArr;
  };

  _Array.diff = function(otherArray) {
    return this.filter(function(val, i, arr) {
      return !otherArray.include(val);
    });
  };

  _Array.diff_all = _Array.diffAll = function(otherArray) {
    var newArr,
      _this = this;
    newArr = this.filter(function(val) {
      return !otherArray.include(val);
    });
    return newArr.concat(otherArray.filter(function(val) {
      return !_this.include(val);
    }));
  };

  _Array.reject = function(from, to) {
    if (to == null) {
      return this.diff([this[from]]);
    } else {
      return this.diff(this.at(from, to));
    }
  };

  _Array.intersection = function(otherArray) {
    return this.filter(function(val, i, arr) {
      return otherArray.include(val);
    });
  };

  _Array.delete_at = _Array.deleteAt = function(from, to) {
    return this.reject(from, to);
  };

  if (!_Array.map) {
    _Array.map = function(callback, thisArg) {
      var A, O, T, k, kValue, len, mappedValue;
      if (!this) {
        throw new TypeError(" this is null or not defined");
      }
      O = Object(this);
      len = O.length >>> 0;
      if (typeof callback !== 'function') {
        throw new TypeError(callback + " is not a function");
      }
      if (thisArg) {
        T = thisArg;
      }
      A = new Array(len);
      k = 0;
      while (k < len) {
        if ((O[k] != null)) {
          kValue = O[k];
          mappedValue = callback.call(T, kValue, k, O);
          A[k] = mappedValue;
        }
        k++;
      }
      return A;
    };
  }

  if (!_Array.filter) {
    _Array.filter = function(fun) {
      "use strict";

      var i, len, res, t, thisp, val, _i;
      if (this === null) {
        throw new TypeError();
      }
      t = Object(this);
      len = t.length >>> 0;
      if (typeof fun !== "function") {
        throw new TypeError();
      }
      res = [];
      thisp = arguments[1];
      for (i = _i = 0; 0 <= len ? _i < len : _i > len; i = 0 <= len ? ++_i : --_i) {
        if ((t[i] != null)) {
          val = t[i];
          console.log(thisp);
          if (fun.call(thisp, val, i, t)) {
            res.push(val);
          }
        }
      }
      return res;
    };
  }

  if (!_Array.reduce) {
    _Array.reduce = function(accumulator) {
      var curr, i, l;
      if (!this) {
        throw new TypeError("Object is null or undefined");
      }
      i = 0;
      l = this.length >> 0;
      if (typeof accumulator !== "function") {
        throw new TypeError("First argument is not callable");
      }
      if (arguments.length < 2) {
        if (l === 0) {
          throw new TypeError("Array length is 0 and no second argument");
        }
        curr = this[0];
        i = 1;
      } else {
        curr = arguments[1];
      }
      while (i < l) {
        if ((this[i] != null)) {
          curr = accumulator.call(void 0, curr, this[i], i, this);
        }
        ++i;
      }
      return curr;
    };
  }

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

  _Function = Function.prototype;

  _Function["new"] = function() {
    return new this;
  };

  _Number = Number.prototype;

  _Number.times = function(fn) {
    var i, _i, _ref, _results;
    _results = [];
    for (i = _i = 0, _ref = this.valueOf(); 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
      _results.push(fn(i));
    }
    return _results;
  };

  _Number.odd = function() {
    return this.valueOf() % 2 !== 0;
  };

  _Number.multiple_of = _Number.multipleOf = function(n) {
    return n % this.valueOf() === 0;
  };

  _Number.min = _Number.mins = _Number.minute = _Number.minutes = function() {
    return this.valueOf() * 60;
  };

  _Number.hour = _Number.hours = function() {
    return this.valueOf() * 60..minutes();
  };

  _Number.day = _Number.days = function() {
    return this.valueOf() * 24..hours();
  };

  _Number.week = _Number.weeks = function() {
    return this.valueOf() * 7..days();
  };

  _Number.ago = function() {
    return Date.now().milli_to_sec() - this.valueOf();
  };

  _Number.milli_to_sec = _Number.milliToSeconds = function() {
    return parseInt(this.valueOf() / 1000);
  };

  _Number.sec_to_milli = _Number.secToMilli = function() {
    return this.valueOf() * 1000;
  };

  _Number.from_now = _Number.fromNow = function() {
    return Date.now().milli_to_sec() + this.valueOf();
  };

  _Number.to_d = _Number.to_date = _Number.toDate = function() {
    return new Date(this.valueOf().sec_to_milli());
  };

  _Number.days_in_month = _Number.daysInMonth = function() {
    var date;
    date = new Date();
    return new Date(date.getFullYear(), this.valueOf() + 1, 0).getDate();
  };

  _Number.days_in_month_of = _Number.daysInMonthOf = function(year) {
    return new Date(year, this.valueOf() + 1, 0).getDate();
  };

}).call(this);
