Improvejs is a coffeeScript made, ruby inspired functions for javascript, focused on code readability

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
		// sum 0 till 9
		sum += i;
	});

### multipleOf, dividerOf

	10..multipleOf(5);  // true
	5..multiple_of(10); // false

	10..dividerOf(5);  // false
	5..divider_of(10); // true

### odd

Checks if number is odd

	7..odd(); // true
	6..odd(); // false

### upto, downto

Returns an array from integer to n

	2..upto(8); // [2, 3, 4, 5, 6, 7, 8]
	18..downto(9); // [18, 17, 16, 15, 14, 13, 12, 11, 10, 9]

	// show all month names
	0..upto(11).each(function(i) {
		console.log(i.monthName());
	});

### minutes, hours, days, weeks

Returns time in seconds for the expression

	1..day(); // 60 * 60 * 24
	8..days();
	2..hours();
	36..minutes();

### ago, fromNow

Returns time in seconds since 1/1/1970

	2..days().ago()
	1..week().fromNow()

if you want to turn it into a Date just use `.toDate()`

`3..hours().from_now().to_d()`


### daysInMonth, daysInMonthOf

Returns the number of days for the given 0-based month

	1..daysInMonth() // 29 (of current year -> 2012)
	1..daysInMonthOf(2011) // 28


### (short)monthName, (short)dayName

	0..monthName();       // "January"
	11..shortMonthName(); // "Dec"

	0..dayName();       // "Sunday"
	6..shortDayName();  // "Sat"


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

`at` Returns indexes at fromIndex till toIndex

	arr.at(2);     // "John"
	arr.at(-1);    // "Doe"
	arr.at(2, -1); // ["John", "Doe"]
	arr.at(-1, 0); // ["Foo", "Doe"]
	arr.at(-1, -3); // ["Foo", "Bar", "Doe"]

`from` Returns indexes from n till last

	arr.from(-2); // ['John', 'Doe']
	arr.from(-4); // ['Foo', 'Bar', 'John', 'Doe']
	arr.from(3);  // ['Doe']
	arr.from(4);  // []

`to` Returns indexes from 0 till n

	arr.to(1);  // ['Foo', 'Bar']
	arr.to(-4); // ['Foo']
	arr.to(-5); // []


### first, last

`arr = ['Foo', 'Bar', 'John', 'Doe']`

`first` Returns the first or first n elements

	arr.first();  // 'Foo'
	arr.first(2); // ["Foo", "Bar"]

`last` Returns the last or last n elements

	arr.last();  // 'Doe'
	arr.last(3); // ["Bar", "John", "Doe"]


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


### min, max

`array = [100, 20, 'a word', 80, 30, 40, 'another word', 50]`

	array.min(); // 20
	array.max(); // 100


### sum, sum_if, multiply, average

`array = [100, 20, 'a word', 80, 30, 40, 'another word', 50]`

	array.sum();      // 320
	array.multiply(); // 9600000000
	array.average();  // 53.333333333333336

	array.sum_if(function(value, index, arr) {
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

documentation in progress...



## Easy developing

open terminal and

`$ cd path/to/improvejs`

**_tab 1_**

join all ./src/*.coffee files into ./improve.js

	$ coffee -j improve.js -w -c src/*.coffee

**_tab 2_**

watch and compile all files changes in ./src/*.coffee and ./spec/*.coffee

	$ coffee -w -c src/*.coffee spec/*.coffee

