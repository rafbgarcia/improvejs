describe 'Array', ->
    arr  = ['Banana', 'Apple', 'Orange']
    arr2 = ['Banana', 'Apple', 'Orange', 'Pear', 'Papaya']
    numbers = [455, 354, 1923, 1003, 123, 2, 53]

    describe '#each', ->
        it 'loops in array', ->
            str = ''
            arr.each (fruit, i) ->
                switch i
                    when 0 then expect(fruit).toEqual 'Banana'
                    when 1 then expect(fruit).toEqual 'Apple'
                    when 2 then expect(fruit).toEqual 'Orange'

    describe '#include', ->
        it 'returns true if array has value', ->
            expect(arr.include 'Banana').toBeTruthy()
            expect(arr.include 'Banan').not.toBeTruthy()

    describe '#at', ->
        it 'throws error if from is not specified', ->
            expect(arr.at).toThrow()

        it 'return element at index', ->
            expect(arr.at(1)).toEqual 'Apple'
            expect(arr.at(-1)).toEqual 'Orange'

        it 'return elements at range', ->
            expect(arr2.at(-1, 0)).toEqual ['Banana', 'Papaya']
            expect(arr2.at(-2, 1)).toEqual ['Banana', 'Apple', 'Pear', 'Papaya']

            expect(arr2.at(-2, -1)).toEqual ['Pear', 'Papaya']
            expect(arr2.at(-1, -3)).toEqual ['Banana', 'Apple', 'Orange', 'Papaya']

            expect(arr2.at(1, -1)).toEqual ['Apple', 'Orange', 'Pear', 'Papaya']
            expect(arr2.at(0, 1)).toEqual ['Banana', 'Apple']
            expect(arr2.at(0, -1)).toEqual ['Banana', 'Apple', 'Orange', 'Pear', 'Papaya']

    describe '#from', ->
        it 'returns elements from n till last', ->
            expect(arr2.from(2)).toEqual ['Orange', 'Pear', 'Papaya']
            expect(arr2.from(-2)).toEqual ['Pear', 'Papaya']
            expect(arr2.from(0)).toEqual ['Banana', 'Apple', 'Orange', 'Pear', 'Papaya']
            expect(arr2.from(6)).toEqual []
            expect(arr2.from(5)).toEqual []
            # value greater than array length
            expect(arr2.from(-6)).toEqual ['Banana', 'Apple', 'Orange', 'Pear', 'Papaya']


    describe '#to', ->
        it 'returns elements from 0 till n', ->
            expect(arr2.to(2)).toEqual ['Banana', 'Apple', 'Orange']
            expect(arr2.to(-1)).toEqual ['Banana', 'Apple', 'Orange', 'Pear', 'Papaya']
            expect(arr2.to(-5)).toEqual ['Banana']
            expect(arr2.to(-6)).toEqual []

    describe '#first', ->
        it 'returns first or first n elements', ->
            expect(arr2.first()).toEqual 'Banana'
            expect(arr2.first(2)).toEqual ['Banana', 'Apple']

    describe '#last', ->
        it 'returns last or last n elements', ->
            expect(arr2.last()).toEqual 'Papaya'
            expect(arr2.last(2)).toEqual ['Pear', 'Papaya']


    describe '#compact', ->
        it 'removes empty elements', ->
            arr3 = arr.concat(null, '', '  ')
            expect(arr3.compact()).toEqual arr

    describe '#count_if', ->
        it 'count elements filtered by a condition', ->
            count = arr2.count_if (el) ->
                el[0] == 'P'
            expect(count).toEqual 2

    describe '#min', ->
        it 'finds the minimum value in array', ->
            numbers.push('a word');
            expect(numbers.min()).toEqual 2

    describe '#max', ->
        it 'finds the maximum value in array', ->
            numbers.push('a word');
            expect(numbers.max()).toEqual 1923

    describe '#sum', ->
        it 'sum all elements in array', ->
            expect(numbers.sum()).toEqual 3913

    describe '#sum_if', ->
        it 'sum elements in array if it attends the given condition', ->
            sum = numbers.sum_if (val, i) ->
                return val < 100
            expect(sum).toEqual 55

    describe '#average', ->
        it 'returns the average of the elements', ->
            expect(numbers.average()).toEqual 559

    describe '#multiply', ->
        it 'multiply all elements in array', ->
            expect(numbers.multiply()).toEqual 4050474036057540

    describe '#unique', ->
        it 'removes duplicated values in array', ->
            duplicated = ['John', 'Smith', 'Foo', 'Smith', 'Bar', 'Bar']
            expect(duplicated.uniq()).toEqual ['John', 'Smith', 'Foo', 'Bar']

    describe '#diff', ->
        it 'returns the values in array that are not in otherArray', ->
            expect(arr2.diff(arr)).toEqual ['Pear', 'Papaya']

    describe '#diffAll', ->
        it 'returns all different values between the 2 arrays arrays', ->
            expect(arr.diffAll(arr2)).toEqual ['Pear', 'Papaya']
            expect(arr2.diffAll(arr)).toEqual ['Pear', 'Papaya']
            expect(arr2.diffAll(arr)).toEqual ['Pear', 'Papaya']

    describe '#reject', ->
        it 'returns an array without the rejected index', ->
            expect(arr.delete_at(1)).toEqual ['Banana', 'Orange']
            expect(arr.reject(0)).toEqual ['Apple', 'Orange']

        it 'returns an array without the rejected range', ->
            expect(arr2.reject(0, -2)).toEqual ['Papaya']
            expect(arr2.reject(1, -1)).toEqual ['Banana']
            expect(arr2.delete_at(1, 2)).toEqual ['Banana', 'Pear', 'Papaya']
            expect(arr2.delete_at(1, -1)).toEqual ['Banana']
            expect(arr2.delete_at(0, -1)).toEqual []

    describe '#intersection', ->
        it 'returns the intersection between arrays', ->
            expect(arr.intersection(arr2)).toEqual ['Banana', 'Apple', 'Orange']
            expect(arr2.intersection(arr)).toEqual ['Banana', 'Apple', 'Orange']

