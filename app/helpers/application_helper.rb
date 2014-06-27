module ApplicationHelper

  # Helper methods for options in a drop down selection for a wig
  # First element is what is displayed, second is what
  # goes into the database
  def wig_colors
    [
      ['select color', nil],
      ['medium brown', 'medium brown'],
      ['black', 'black'],
      ['dark brown', 'dark brown'],
      ['light brown', 'light brown'],
      ['blonde', 'blonde'],
      ['red', 'red'],
      ['white', 'white'],
      ['grey', 'grey'],
      ['other', 'other']
    ]
  end

  def wig_lengths
    [
      ['select length', nil],
      ['medium', 'medium'],
      ['long', 'long'],
      ['medium/long', 'medium long'],
      ['medium/short', 'medium short'],
      ['short', 'short']
    ]
  end

  def wig_conditions
    [
      ['select condition', nil],
      ['new', 'new'],
      ['lightly used', 'lightly used'],
      ['fair', 'fair'],
      ['poor', 'poor']
    ]
  end

  def wig_constructions
    [
      ['select construction', nil],
      ['basic cap', 'basic cap'],
      ['hand tied', 'hand tied'],
      ['monofilamnet', 'monofilamnet'],
      ['lace front', 'lace front']
    ]
  end

  def wig_sizes
    [
      ['select size', nil],
      ['average', 'average'],
      ['large', 'large'],
      ['average/large', 'average large'],
      ['average/petite', 'average petite'],
      ['petite', 'petite']
    ]
  end

  def wig_materials
    [
      ['select material', nil],
      ['synthetic', 'synthetic'],
      ['human hair', 'human hair']
    ]
  end

  def wig_textures
    [
      ['select texture', nil],
      ['straight', 'straight'],
      ['curly', 'curly'],
      ['wavy', 'wavy']
    ]
  end

  def wig_styles
    [
      ['select style', nil],
      ['bangs', 'bangs'],
      ['layered', 'layered'],
      ['pixie', 'pixie'],
      ['bobs', 'bobs']
    ]
  end

  def wig_genders
    [
      ['select gender', nil],
      ['female', 'female'],
      ['male', 'male']
    ]
  end
end
