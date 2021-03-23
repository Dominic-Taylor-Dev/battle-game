require_relative './attack'

class Player
  DEFAULT_HIT_POINTS = 60
  
  attr_reader :hitpoints, :max_hp, :name

  def initialize(name, hitpoints = DEFAULT_HIT_POINTS)
    @name = name
    @max_hp = hitpoints
    @hitpoints = hitpoints
  end

  def take_damage
    @hitpoints -= Attack.new.attack_strength
  end
end