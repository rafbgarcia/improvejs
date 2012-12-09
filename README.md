Improvejs is a coffeeScript made, ruby inspired functions for javascript

All tested with Jasmine


## What we got until now

* [Number](https://github.com/rafbgarcia/improvejs/#number)
* [Array](https://github.com/rafbgarcia/improvejs/#array)
* [Date](https://github.com/rafbgarcia/improvejs/#date)


# Number

#### times

Loops n times starting from 0

	3..times(function(index) {
		// do something
	});

	var count = 10, sum = 0;
	count.times(function(i) {
		sum += index; // sum 0 till 9
	});

### multiple

Checks if number is multiple of given number

	10..multipleOf(5);  // true
	36..multiple_of(6); // true

### odd

Checks if number is odd

	7..odd(); // true
	6..odd(); // false

### minutes, hours, days, weeks

	1..day();   // in seconds -> 60 * 60 * 24
	8..days();
	2..hours();
	36..minutes();

### ago, fromNow

Returns seconds since 1/1/1970

	2..days().ago()
	1..week().fromNow()

if you want to turn it into a Date just use `.toDate()`

`3..hours().from_now().to_d()`


### daysInMonth, daysInMonthOf

Returns the number of days for the given 0-based month

	1..daysInMonth() // 29 (of current year -> 2012)
	1..daysInMonthOf(2011) // 28

### Playing around

	// calendar
    12..times(function(month) {
        console.log('Month: ' + (month+1));
        console.log('================================');
        month.daysInMonth().times(function(day) {
            console.log(day+1);
        });
        console.log('================================');
    });


# Array

### each

Loops into array

`arr = ['Foo', 'Bar', 'John', 'Doe']`

	arr.each(function(value, i) {
		if(i.odd()) {
			console.log(value); // "Bar" ; "Doe"
		}
	});

### include

Checks if array include value

`arr = ['Foo', 'Bar', 'John', 'Doe']`

	arr.include('Foo'); // true
	arr.include('Bla'); // false

### at, from, to

`arr = ['Foo', 'Bar', 'John', 'Doe']`

	// Returns indexes at fromIndex till toIndex
	arr.at(2);     // "John"
	arr.at(-1);    // "Doe"
	arr.at(2, -1); // ["John", "Doe"]
	arr.at(-1, 1); // []

 	// Returns indexes from n till last
	arr.from(-2); // ['John', 'Doe']
	arr.from(3);  // ['Doe']

	// Returns indexes from 0 till n
	arr.to(1);  // ['Foo', 'Bar']
	arr.to(-4); // ['Foo']
	arr.to(-5); // []


### compact

Returns an array without empty values

`array = ['Foo', null, 'Bar', 'John', '', '   ', 'Doe']`

	array.compact();  // ['Foo', 'Bar', 'John', 'Doe']

### count_if

Count elements filtered by a condition

`array = ['Foo', null, 'Bar', 'John', '', '   ', 'Doe']`

	// count empty values
	var count = array.count_if(function(val, index, array) {
		return !val || val.trim().length == 0
	});
	console.log(count); // 3


### min, max, sum, sum_if, multiply

`array = [100, 20, 'a word', 80, 30, 40, 'another word', 50]`

	array.min();      // 20
	array.max();      // 100
	array.sum();      // 320
	array.multiply(); // 9600000000

	array.sum_if(function(value, index, array) {
		return value <= 50;
	});
	// 140


### unique

Returns the array without duplicated values

`array = ['Foo', 'Foo', 'Bar', 'Foo', 'Smith', 'John', 'Smith']`

	array.uniq(); // ["Foo", "Bar", "Smith", "John"]


### intersection

Returns the values in array1 that exists in array2

`array1 = ['Foo', 'Bar', 'John', 'Smith']`

`array2 = ['John', 'Doe', 'Foo', 'Bar']`

	array1.intersection(array2); // ["Foo", "Bar", "John"]


### diff, diffAll

`array1 = ['Foo', 'Bar', 'John', 'Smith']`

`array2 = ['John', 'Doe', 'Foo', 'Bar']`

	// Returns values in array1 that are not in array2
	array1.diff(array2); // ["Smith"]

	// Returns all different values
	array1.diffAll(array2); // ["Smith", "Doe"]


### reject, delete_at

Returns an array without the specified indexes

`arr = ['Foo', 'Bar', 'John', 'Doe']`

	arr.reject(0); 		   // ["Bar", "John", "Doe"]
	arr.reject(-2, -1);    // ["Foo", "Bar"]
	arr.delete_at(0);	   // ["Bar", "John", "Doe"]
	arr.delete_at(-2, -1); // [ "Foo", "Bar"]


# Date

documenting...



## Easy developing

#### on terminal

**_tab 1_**

	$ cd path/to/improvejs
	$ coffee -j improve.js -w -c src/*.coffee

**_tab 2_**

	$ coffee -w -c src/*.coffee spec/*.coffee
