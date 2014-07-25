#!/usr/bin/env ruby
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

# initial data for hidden markov chain
trans_state_healty = { 'Healthy' => 0.7, 'Fever' => 0.3}
trans_state_fever = { 'Healthy' => 0.4, 'Fever' => 0.6}
emis_state_healthy = { 'normal' => 0.5, 'cold' => 0.4, 'dizzy' => 0.1}
emis_state_fever = { 'normal' => 0.1, 'cold' => 0.3, 'dizzy' => 0.6}
start_prob = { 'Healthy' => 0.6, 'Fever' => 0.4 }
oberservation_doctor = ['normal', 'cold', 'dizzy']

# calculate the hidden states transition chains
state_healthy = State.new("Healthy", start_prob['Healthy'], emis_state_healthy, trans_state_healty)
state_fever = State.new("Fever", start_prob['Fever'], emis_state_fever, trans_state_fever)
states = [state_healthy, state_fever]
doctor = Hmm.new(states, oberservation_doctor)
result = doctor.verterbi_algorihm

# result
puts result.to_s
