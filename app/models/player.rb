require_relative './attack'
require_relative './player_avatar'

class Player
  DEFAULT_HIT_POINTS = 60
  
  attr_reader :hitpoints, :max_hp, :name, :image_front, :image_back

  def initialize(name, hitpoints = DEFAULT_HIT_POINTS)
    @name = name
    @max_hp = hitpoints
    @hitpoints = hitpoints
    @poke_type = ['charmander', 'squirtle', 'bulbasaur', 'pikachu'].sample
    @image_front = PlayerAvatar.new.image_front(@poke_type)
    @image_back = PlayerAvatar.new.image_back(@poke_type)
  end

  def take_damage(attack_type)
    @hitpoints -= Attack.new(attack_type).attack_strength
  end
end