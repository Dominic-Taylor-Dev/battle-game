class Attack
  MIN_STRENGTH = 10
  MAX_STRENGTH = 10
  
  def attack_strength
    return rand(MIN_STRENGTH..MAX_STRENGTH)
  end
end