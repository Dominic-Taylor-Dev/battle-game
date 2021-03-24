class PlayerAvatar
  # uses 5th gen sprites from e.g. https://pokemondb.net/sprites/charmander
  
  def image_front(poke_type)
    case poke_type
    when 'charmander'
      'https://img.pokemondb.net/sprites/black-white/anim/normal/charmander.gif'
    when 'squirtle'
      'https://img.pokemondb.net/sprites/black-white/anim/normal/squirtle.gif'
    when 'bulbasaur'
      'https://img.pokemondb.net/sprites/black-white/anim/normal/bulbasaur.gif'
    when 'pikachu'
      'https://img.pokemondb.net/sprites/black-white/anim/normal/pikachu.gif'
    end
  end

  def image_back(poke_type)
    case poke_type
    when 'charmander'
      'https://img.pokemondb.net/sprites/black-white/anim/back-normal/charmander.gif'
    when 'squirtle'
      'https://img.pokemondb.net/sprites/black-white/anim/back-normal/squirtle.gif'
    when 'bulbasaur'
      'https://img.pokemondb.net/sprites/black-white/anim/back-normal/bulbasaur.gif'
    when 'pikachu'
      'https://img.pokemondb.net/sprites/black-white/anim/back-normal/pikachu.gif'
    end
  end
end