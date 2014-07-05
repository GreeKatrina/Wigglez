class StaticPagesController < ApplicationController

  def contact_us
    render 'contact_us'
  end

  def about_us
    render 'about_us'
  end

end
