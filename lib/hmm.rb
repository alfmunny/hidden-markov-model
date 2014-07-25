class Hmm
  def initialize(states, obers)
    @states = states
    @obers = obers
  end

  def states
    @states
  end

  def obers
    @obers
  end

  def delta_map
    delta = Hash.new
    @states.each do |s|
      first = s.start_prob * s.emis[obers[0]]
      delta[s.name] = [ "delta" => first]
    end

    count = 1 # from the second oberservation
    # calculate for each time stamp
    @obers[1..-1].each do |o|
      # calculate for each starting state a chain
      @states.each do |s|
        obers_prob = s.emis[o]
        max = 0.0 #initial max every time before the comparision begins
        former_state = 0 #initial former state every time before the comparision begins
        # compare transition probability of all former states of this current state
        @states.each do |f|
          trans_prob = f.trans[s.name]
          former_delta = delta[f.name][count-1]["delta"]
          tmp = trans_prob * former_delta
          if tmp > max
            max = tmp
            former_state = f.name
          end
        end
        new_delta = obers_prob * max
        delta[s.name].push("delta" => new_delta, "former_state" => former_state )
      end
      count += 1
    end
    return delta
  end

  def verterbi_algorihm
    delta = delta_map
    keys = delta.keys
    length = delta[keys[0]].length
    max = 0
    last_state = ''
    keys.each do |k|
      tmp = delta[k].last["delta"]
      if tmp > max
        max = tmp
        last_state = k
      end
    end
    #puts last_state
    hidden_states = Array.new
    hidden_states.push(last_state)
    latter_state = last_state
    i = length
     while i > 1
      former_state = delta[latter_state][i-1]["former_state"]
      latter_state = former_state
      #puts latter_state
      i -= 1
      hidden_states.push(former_state)
    end
    return hidden_states.reverse
  end

  def to_s
    "States: #@states -- Oberservation: #@obers"
  end
end
