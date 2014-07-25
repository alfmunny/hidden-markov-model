#!/usr/bin/env ruby
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

# initial data for hidden markov chain
emis_state_fair = { 1 => 0.16666666, 2 => 0.16666666, 3 => 0.16666666, 4 => 0.16666666, 5 => 0.16666666, 6 => 0.16666666}
emis_state_cheat = { 1 => 0.1, 2 => 0.1, 3 => 0.1, 4 => 0.1, 5 => 0.1, 6 => 0.5}
trans_state_fair = { "fair" => 0.7, "cheat" => 0.3 }
trans_state_cheat = { "fair" => 0.4, "cheat" => 0.60 }
start_prob = { 'fair' => 0.5, 'cheat' => 0.5 }
oberservation_casino = [1, 1, 5, 6, 6, 6, 3, 5]

# calculate the hidden states transition chains
state_fair= State.new("fair", start_prob['fair'], emis_state_fair, trans_state_fair)
state_cheat = State.new("cheat", start_prob['cheat'], emis_state_cheat, trans_state_cheat)
states = [state_fair, state_cheat]
casino = Hmm.new(states, oberservation_casino)
result = casino.verterbi_algorihm

# result
puts result.to_s
