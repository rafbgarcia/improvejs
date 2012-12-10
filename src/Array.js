// Generated by CoffeeScript 1.3.3
(function() {
  var _Array;

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
    if (this.indexOf(val) === -1) {
      return false;
    } else {
      return true;
    }
  };

  _Array.at = function(from, to) {
    var abs;
    if (from == null) {
      throw new TypeError('argument "from" must be specified');
    }
    abs = Math.abs;
    if (to == null) {
      if (from >= 0) {
        return this[from];
      } else {
        return this[this.length - abs(from)];
      }
    }
    if (from >= 0) {
      if (from < 0) {
        from = this.length - abs(from);
      }
      if (to < 0) {
        to = this.length - abs(to);
      }
      return this.filter(function(val, i) {
        return (from <= i && i <= to);
      });
    } else {
      if (from < 0) {
        from = this.length - abs(from);
      }
      if (to < 0) {
        to = this.length - abs(to);
      }
      return this.filter(function(val, i) {
        return i >= from || i <= to;
      });
    }
  };

  _Array.to = function(to) {
    return this.at(0, to);
  };

  _Array.from = function(from) {
    if (from < 0) {
      from = this.length - Math.abs(from);
    }
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
      if (!isNaN(previous) && !isNaN(current)) {
        if (previous < current) {
          return previous;
        } else {
          return current;
        }
      } else if (previous === NaN && current !== NaN) {
        return current;
      } else {
        return previous;
      }
    });
  };

  _Array.max = function() {
    return this.reduce(function(previous, current) {
      previous = parseInt(previous, 10);
      current = parseInt(current, 10);
      if (!isNaN(previous) && !isNaN(current)) {
        if (previous > current) {
          return previous;
        } else {
          return current;
        }
      } else if (previous === NaN && current !== NaN) {
        return current;
      } else {
        return previous;
      }
    });
  };

  _Array.sum = function() {
    return this.reduce(function(previous, current) {
      if (!isNaN(previous) && !isNaN(current)) {
        return previous + current;
      } else if (previous === NaN && current !== NaN) {
        return current;
      } else {
        return previous;
      }
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
      if (!isNaN(previous) && !isNaN(current)) {
        return previous * current;
      } else if (previous === NaN && current !== NaN) {
        return current;
      } else {
        return previous;
      }
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

  _Array.delete_at = _Array.deleteAt = _Array.reject = function(from, to) {
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

}).call(this);
