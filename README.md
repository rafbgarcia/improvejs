Improvejs is a coffeeScript made, ruby inspired functions for javascript

All tested with Jasmine

## Developing

#### on terminal

**_tab 1_**

	$ cd path/to/improvejs
	$ coffee -j improve.js -w -c src/*.coffee

**_tab 2_**

	$ coffee -w -c src/*.coffee spec/*.coffee


## What we got until now

# Number

#### times

	3..times(function(index) {
		// do something
	});

	var count = 10, sum = 0;
	count.times(function(i) {
		sum += index; // sum 0 till 9
	});

### multiple

	10..isMultipleOf(5); // true
	36..multiple_of(6); // true

### odd

	7..odd(); // true
	6..odd(); // false

### minutes, hours, days, weeks

	1..day();   // in seconds -> 60 * 60 * 24
	8..days();
	2..hours();
	36..minutes();

### ago, fromNow

	2..days().ago() // return seconds since 1/1/1970
	1..week().fromNow()
	6..hours().from_now().toDate()

if you want to turn it into a Date just use `.toDate()`

`3..hours().from_now().to_d()`


### daysInMonth, daysInMonthOf

	// 0-based months
	1..daysInMonth() // 29 (of current year -> 2012)
	1..daysInMonthOf(2011) // 28
