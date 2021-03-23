class Attack
  MIN_STRENGTH = 1
  MAX_STRENGTH = 5
  
  def attack_strength
    return rand(MIN_STRENGTH..MAX_STRENGTH)
  end
end