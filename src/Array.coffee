_Array = Array.prototype

_Array.each = (fn) ->
    fn(value, i) for value, i in @


_Array.include = (val) ->
    if @indexOf(val) == -1 then false else true


_Array.at = (from, to) ->
    throw new TypeError('argument "from" must be specified') unless from?

    abs = Math.abs
    unless to?
        return if from >= 0
            @[from]
        else
            @[@length - abs(from)]

    from = @length - abs(from) if from < 0
    to   = @length - abs(to)   if to   < 0

    if from <= to
        @filter (val, i) ->
            return from <= i <= to
    else
        @filter (val, i) ->
            i >= from or i <= to


_Array.to = (to) ->
    to = @length - Math.abs(to) if to < 0
    return [] if to < 0
    @at 0, to

_Array.from = (from) ->
    return [] if from > @length
    @at from, @length


_Array.first = (n) ->
    if not n? or n == 1
        @at(0)
    else
        @at(0, n - 1)


_Array.last = (n) ->
    if not n? or n == 1
        @at(-1)
    else
        @at(-n, -1)


_Array.compact = ->
    newArr = @filter (el) ->
        el? and el.trim()
    newArr


_Array.count_if = (callback) ->
    newArr = @filter (el, i, arr) ->
        callback(el, i, arr)
    newArr.length


_Array.min = ->
    @reduce (previous, current) ->
        previous = parseInt(previous, 10)
        current  = parseInt(current, 10)
        if !isNaN(previous) and !isNaN(current)
            if previous < current then previous else current
        else if previous is NaN and current isnt NaN
            current
        else
            previous


_Array.max = ->
    @reduce (previous, current) ->
        previous = parseInt(previous, 10)
        current = parseInt(current, 10)
        if !isNaN(previous) and !isNaN(current)
            if previous > current then previous else current
        else if previous is NaN and current isnt NaN
            current
        else
            previous


_Array.sum = ->
    @reduce (previous, current) ->
        if !isNaN(previous) and !isNaN(current)
            previous + current
        else if previous is NaN and current isnt NaN
            current
        else
            previous


_Array.average = ->
    count = @count_if (val) ->
        not isNaN(val)

    @sum() / count


_Array.sum_if = (fn) ->
    newArr = @filter (val, i, arr) ->
        fn(val, i, arr)
    newArr.sum()


_Array.multiply = ->
    @reduce (previous, current) ->
        if !isNaN(previous) and !isNaN(current)
            previous * current
        else if previous is NaN and current isnt NaN
            current
        else
            previous


_Array.uniq   =
_Array.unique = (where) ->
    newArr = []
    newArr.push(i) for i in @ when not newArr.include(i)
    newArr


_Array.diff   = (otherArray) ->
    @filter (val, i, arr) ->
        not otherArray.include(val)


_Array.diff_all =
_Array.diffAll  = (otherArray) ->
    newArr = @filter (val) ->
        not otherArray.include(val)
    newArr.concat otherArray.filter (val) =>
        not @include(val)


_Array.delete_at =
_Array.deleteAt  =
_Array.reject    = (from, to) ->
    unless to?
        @diff [@[from]]
    else
        @diff @at(from, to)


_Array.intersection = (otherArray) ->
    @filter (val, i, arr) ->
        otherArray.include(val)



if not _Array.map
    _Array.map = (callback, thisArg) ->
        throw new TypeError " this is null or not defined" if not @

        O   = Object(@)
        len = O.length >>> 0

        if typeof callback != 'function'
            throw new TypeError(callback + " is not a function")

        T = thisArg if thisArg
        A = new Array(len)
        k = 0

        while(k < len)
            if (O[k]?)
                kValue = O[ k ]
                mappedValue = callback.call(T, kValue, k, O)
                A[ k ] = mappedValue
            k++

        return A


if not _Array.filter
    _Array.filter = (fun) ->
        "use strict"

        if @ == null
            throw new TypeError()

        t = Object(@)
        len = t.length >>> 0
        if typeof fun != "function"
            throw new TypeError()

        res   = []
        thisp = arguments[1]

        for i in [0...len]
            if (t[i]?)
                val = t[i]
                console.log thisp
                if (fun.call(thisp, val, i, t))
                    res.push(val)

        return res


if not _Array.reduce
    _Array.reduce = (accumulator) ->
        throw new TypeError("Object is null or undefined") unless @

        i = 0
        l = @length >> 0

        if(typeof accumulator != "function")
            throw new TypeError("First argument is not callable")

        if(arguments.length < 2)
            if (l == 0)
                throw new TypeError("Array length is 0 and no second argument")
            curr = @[0]
            i = 1

        else
            curr = arguments[1]

        while(i < l)
            if(@[i]?)
                curr = accumulator.call(undefined, curr, @[i], i, @)
            ++i

        curr
