class BlogController < ApplicationController
  def home
    @title = "Home"
  end
  def electro
    @title = "Electroncs"
  end
  def prog
    @title = "Programming"
  end
  def nix
    @title = "*nix"
  end
  def other
    @title = "Talks"
  end

end
