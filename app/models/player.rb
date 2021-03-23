require_relative './attack'

class Player
  DEFAULT_HIT_POINTS = 20
  
  attr_reader :hitpoints, :name

  def initialize(name, hitpoints = DEFAULT_HIT_POINTS)
    @name = name
    @hitpoints = hitpoints
  end

  def take_damage
    @hitpoints -= Attack.new.attack_strength
  end
end