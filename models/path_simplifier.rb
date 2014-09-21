class PathSimplifier
  def initialize path
    @path = @original = path
  end

  def solve
    remove_trailing_slash
    remove_single_dot
    remove_double_dot

    @path
  end

  def remove_trailing_slash
    @path.gsub!(/\/$/, '')
  end
  private :remove_trailing_slash

  def remove_single_dot
    @path.gsub!(/\/.\//, '/')
  end
  private :remove_single_dot

  def remove_double_dot
    arr = @path.split '/'

    while index = arr.index('..') 
      arr.slice! index
      arr.slice! index - 1
    end

    @path = arr.join('/')
  end
  private :remove_double_dot

  # alternative solution using ruby build-in method
  def solve_by_ruby_build_in
    require 'pathname'
    Pathname.new(@original).cleanpath.to_s
  end
  
end
