# WE TRIP [![Build Status](https://travis-ci.org/we-trip/we-trip.svg?branch=master)](https://travis-ci.org/we-trip/we-trip) [![Coverage Status](https://coveralls.io/repos/github/we-trip/we-trip/badge.svg?branch=master)](https://coveralls.io/github/we-trip/we-trip?branch=master)

**WE TRIP** is a Ruby on Rails website that help people easily create useful trip-planning

Group-2: **nongdenchet**, **LanDoan**, **Corsad** 

URL: **https://wetrip.herokuapp.com**

## Commitment
* Quan: **13** points/week
* Lan: **5** points/week
* Khanh: **3** points/week
* Total: 4 x (5 + 3 + 13) = **84 points**

## Review and fix bugs [14 points]

## User Stories [70 points]

### Required [62.5]:
* [x][0.5] As a user I want to register a new account
* [x][0.5] As a user I want to login/logout to the application
* [ ][0.5] As a user I can edit my profile
* [ ][1.5] As a user at a home page I can see the search box and some description information
	* [ ][0.5] As a user I can search for a trip-planning with origin and destinattion
	* [ ][1] As a user I can see best contributor
* [x][2.5] As a user I can see detail of a location
	* [x][1] Detail location should have some description
	* [x][0.5] Detail location should have a map to display location
	* [x][1] Detail location should have a side-bar that includes pictures about the location
* [ ][5] As a user I can edit the trip (before publishing, once the trip is published it can not be edited, they can only add attachment like photos)
* [ ][1] Only member in the trip can edit that trip
* [ ][20] As a user I can create a new trip-planning
	* [ ][3] First screen contains some basic info (start date, end date, departure and destination (multiple), expected budget, friends, title, description)
	* [ ][6] Second screen includes itinerary (2 tabs)
		* [ ][3] Schedule: tourist attractions for each day with schedule
		* [ ][3] Map: the map includes all the locations
	* [ ][5] Thrid screen includes budget planning
		* [ ][1] Pre-trip seciton
		* [ ][1] Transport section
		* [ ][1] On-trip section: list all destinations with price base on each day
		* [ ][1] User can edit the budget 
		* [ ][1] User should be notified if the total budget exceed the expected expense (equal to budget for invidual multiply by the number of friends)
		* [ ][5] As a user I can plan budget for each member in the trip-planning 
	* [ ][6] Others screen includes 3 tabs (1 is optional - the map):
		* [ ][3] Attachment (only allow png, jpg, gif, pdf)
		* [ ][2] Todo-list
		* [ ][1] User can publish the trip (after the trip end, only owner can publish the trip)
* [ ][4] Notification when
	* [ ][1] Invlove in the trip, remind publish
	* [ ][3] When trip change (edit, create, publish)
* [x][3] Each user can have points
	* [x][1] Views count (1 points)
	* [x][1] Clone count (5 points)
	* [x][1] Create a trip (10 points)
* [ ][5] As a user outside of a trip-planning I can view detail of a published trip-planning but cannot be editted
* [ ][11] User can clone a trip-planning and edit it
	* [ ][5] Delete: friends, todos, attachments, end date
	* [ ][1] Has default start date
	* [ ][5] Logic update number of dates (can only update the number of days that larger or equal the number of date in on-trip planning)
* [x][8] Information about locations, places and budgets should be fetched from somewhere (from the third party)

### Optinal [7.5 points]:
* [ ][3] The system can create a gif or a recap-video after the trip has been plubished in the trip-planning detail
* [x][0.5] User can login with facebook
* [ ][3] Map: A map that draws all the roadmap in summary screen
* [ ][1] Member can receive email when
	* [ ][0.5] Be involed to a trip
	* [ ][0.5] Reminder to publish
* [ ][3] As a user, if we have space time in the schedule the system can suggest some nearby place to play with  
* [ ][3] As a user, I want to add travel time to Itinerary 

## Database schema
![alt text](https://github.com/we-trip/we-trip/blob/develop/db_chema.png "Data")

## Some wireframes
###The wireframes pdf has been included in the repo
![alt text](http://s24.postimg.org/c48v9utc1/Screenshot_2016_04_05_07_13_11.png "Data")
![alt text](http://s24.postimg.org/j4s9ow5q9/Screenshot_2016_04_05_07_13_17.png "Data")
![alt text](http://s24.postimg.org/4a89oglj5/Screenshot_2016_04_05_07_13_24.png "Data")

## Some patterns
* Service: when doing complicated insert to database (example: create order, calculate points, ...)
* Queries: when doing complicated queries from database
* Decorator: when adding more responsibilities for model to be displayed in view
* Policies: when doing complicated queries for exisitng model
