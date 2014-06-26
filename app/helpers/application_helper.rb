module ApplicationHelper

  # Helper methods for options in a drop down selection for a wig
  # First element is what is displayed, second is what
  # goes into the database
  def wig_colors
    [
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
      ['medium', 'medium'],
      ['long', 'long'],
      ['medium/long', 'medium long'],
      ['medium/short', 'medium short'],
      ['short', 'short']
    ]
  end

  def wig_conditions
    [
      ['new', 'new'],
      ['lightly used', 'lightly used'],
      ['fair', 'fair'],
      ['poor', 'poor']
    ]
  end

  def wig_constructions
    [
      ['basic cap', 'basic cap'],
      ['hand tied', 'hand tied'],
      ['monofilamnet', 'monofilamnet'],
      ['lace front', 'lace front']
    ]
  end

  def wig_sizes
    [
      ['average', 'average'],
      ['large', 'large'],
      ['average/large', 'average large'],
      ['average/petite', 'average petite'],
      ['petite', 'petite']
    ]
  end

  def wig_materials
    [
      ['synthetic', 'synthetic'],
      ['human hair', 'human hair']
    ]
  end

  def wig_textures
    [
      ['straight', 'straight'],
      ['curly', 'curly'],
      ['wavy', 'wavy']
    ]
  end

  def wig_styles
    [
      ['bangs', 'bangs'],
      ['layered', 'layered'],
      ['pixie', 'pixie'],
      ['bobs', 'bobs']
    ]
  end

  def wig_genders
    [
      ['female', 'female'],
      ['male', 'male']
    ]
  end
end
