#!/usr/bin/env ruby

class State
  def initialize(name, start_prob, emis, trans)
    @name = name
    @start_prob = start_prob
    @emis = emis
    @trans = trans
  end

  def name # name of state
    return @name
  end

  def start_prob # start probability
    return @start_prob
  end

  def emis # emission probability
    return @emis
  end

  def trans # transition probabilty
    return @trans
  end

  def to_s
    "State: #@name--#@start_prob"
  end
end
