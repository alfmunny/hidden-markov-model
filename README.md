Simple Hidden Markov Model
===

This is a simple case calculator of the states sequence
through a exsisting [Hidden Markov Model](http://en.wikipedia.org/wiki/Hidden_Markov_model).

The program is written in [Ruby](https://www.ruby-lang.org).

## Run

Fetch the project.
	
	git clone https://github.com/alfmunny/hidden-markov-model.git

Run the use cases

	./calc_casino.rb
	./calc_doctor.rb
	./calc_weather.rb


## Condition

For every HMM there are four initial conditions

* start probabilties of every states
* transition probabilties matrix including all states
* emission probabilties matrix for every state including all oberservation posibilities.
* a oberservation sequence

More informations are shown in Use Cases

Fulfilled these conditions the calculator would make a sequence hypothesis 
according to the oberservation by using [Viterbi algorithm](http://en.wikipedia.org/wiki/Viterbi_algorithm).

## Classes

### State

It defines the state prorperty.

### Hmm

It defines the Hidden Markov Model's property including the Viterbi algorithm method.

## Use Cases

Three use cases are provided.

### Casino

Considering a casino would occasionally use a loaded dice
to cheat the customer.

Through overserving the outcoming results of the dice to
guess when the dice is loaded

State posibilities:

* Fair
* Cheat

Oberservation posibilities: the dice number

### Doctor

Doctor would make a hypothesis by asking the patient the
previous behaviour.

State posibilities:

* Healthy
* Fever

Oberservation posibilities:

* normal
* cold
* dizzy

### Weahter

By knowing yesterday's weather to predict today's weather
according to the oberservations.

State posibilities:

* Sunny
* Cloudy
* Rainy

Oberservation posibilities:

* Dry 
* Dryish 
* Damp 
* Soggy

## Parameters modifying

To change any intial conditions, just modify them in the use cases file(ex. calc_doctor.rb).

For example by adding some more oberservation results in the oberservation sequence 
to see the new hypothesis sequence or change the probabilties. 
