class Attack
  ATTACK_1_MIN_STRENGTH = 10
  ATTACK_1_MAX_STRENGTH = 10
  ATTACK_2_MIN_STRENGTH = 5
  ATTACK_2_MAX_STRENGTH = 20

  def initialize(attack_type)
    @attack_type = attack_type
  end

  def attack_strength
    case @attack_type
    when "attack_1"
      rand(ATTACK_1_MIN_STRENGTH..ATTACK_1_MAX_STRENGTH)
    when "attack_2"
      rand(ATTACK_2_MIN_STRENGTH..ATTACK_2_MAX_STRENGTH)
    end
  end
end
