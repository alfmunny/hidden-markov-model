#!/usr/bin/env ruby
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

# initial data for hidden markov chain
trans_state_sunny = { 'Sunny' => 0.5, 'Cloudy' => 0.375, 'Rainy' => 0.125}
trans_state_cloudy = { 'Sunny' => 0.25, 'Cloudy' => 0.125, 'Rainy' => 0.625}
trans_state_rainy = { 'Sunny' => 0.25, 'Cloudy' => 0.375, 'Rainy' =>0.375 }
emis_state_sunny = { 'Dry' => 0.6, 'Dryish' => 0.2, 'Damp' => 0.15, 'Soggy' => 0.05}
emis_state_cloudy = { 'Dry' => 0.25, 'Dryish' => 0.25, 'Damp' => 0.25, 'Soggy' => 0.25}
emis_state_rainy = { 'Dry' => 0.05, 'Dryish' => 0.1, 'Damp' => 0.35, 'Soggy' => 0.5}
start_prob = { 'Sunny' => 0.63, 'Cloudy' => 0.17, 'Rainy' => 0.20 }
oberservation_weather = ['Dry', 'Dryish', 'Damp', 'Soggy']

# calculate the hidden states transition chains
state_sunny = State.new('Sunny', start_prob['Sunny'], emis_state_sunny, trans_state_sunny)
state_cloudy = State.new('Cloudy', start_prob['Cloudy'], emis_state_cloudy, trans_state_cloudy)
state_rainy = State.new('Rainy', start_prob['Rainy'], emis_state_rainy, trans_state_rainy)
states = [state_sunny, state_cloudy, state_rainy]
weather = Hmm.new(states, oberservation_weather)
result = weather.verterbi_algorihm

# result
puts result.to_s
