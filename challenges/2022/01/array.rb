class Array
  def split(value = nil)
    arr = dup
    result = []
    while (idx = arr.index(value))
      result << arr.shift(idx)
      arr.shift
    end
    result << arr
  end
end
