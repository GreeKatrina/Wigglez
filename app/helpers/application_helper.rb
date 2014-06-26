module ApplicationHelper

  # Methods for drop-down selections when creating a wig
  # First element is what is displayed, second is what
  # goes into the database
  def wig_colors
    [
      ['black', 'black'],
      ['dark brown', 'dark brown'],
      ['medium brown', 'medium brown'],
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
      ['long', 'long'],
      ['medium/long', 'medium long'],
      ['medium', 'medium'],
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
      ['hand tied', 'hand tied'],
      ['monofilamnet', 'monofilamnet'],
      ['lace front', 'lace front'],
      ['basic cap', 'basic cap']
    ]
  end

  def wig_sizes
    [
      ['large', 'large'],
      ['average/large', 'average large'],
      ['average', 'average'],
      ['average/petite', 'average petite'],
      ['petite', 'petite']
    ]
  end

  def wig_materials
    [
      ['human hair', 'human hair'],
      ['synthetic', 'synthetic']
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
      ['bobs', 'bobs'],
      ['pixie', 'pixie'],
      ['layered', 'layered'],
      ['bangs', 'bangs']
    ]
  end
end
