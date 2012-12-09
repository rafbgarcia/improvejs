Object.prototype = do ->
  proto = Object.prototype
  proto.each = (fn) ->
      for key of this
          fn(key)
