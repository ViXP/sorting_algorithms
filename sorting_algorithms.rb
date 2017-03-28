class Array
  # Quick Sort algorithm implementation
  def quick_sort
    return [] if (self.size == 0)
    pos = delete_at(rand(size))
    left, right = partition(&pos.method(:>))
    [*left.quick_sort, pos, *right.quick_sort]
  end

  # Merge Sort algorithm implementation
  def merge_sort
    return self if length <= 1
    middle = (length / 2).floor
    left = self[0..middle - 1].merge_sort
    right = self[middle..length].merge_sort
    merge left, right
  end

  # Bubble Sort algorithm implementation
  def bubble_sort
    each do
      i = 0
      1.upto(length-1) do
        self[i], self[i+1] = self[i+1], self[i] if (self[i] > self[i+1])
        i += 1
      end
    end
    self
  end

  # Insertion Sort algorithm implementation
  def insertion_sort
    i = 0
    1.upto(length-1) do
      if self[i] > self[i+1]
        self[i], self[i+1] = self[i+1], self[i]
        j = i
        while j > 0 do
          if self[j] < self[j-1]
            self[j-1], self[j] = self[j], self[j-1]
          end
          j -= 1 
        end        
      end
      i += 1
    end
    self
  end

  # Counting Sort algorithm implementation
  def counting_sort
    intermed, final = [], []
    each {|el| intermed[el] = intermed[el] ? intermed[el] + 1 : 1 }
    intermed.each_with_index {|v,k| intermed[k] = (k > 0) ? intermed[k-1].to_i + v.to_i : v.to_i}.reject(&:nil?)
    each {|el| final[intermed[el]] = el}
    final.reject(&:nil?)
  end

  # Radix Sort algorithm implementation
  def radix_sort
    each { |el| size = (size || 0 < el.to_s.length) ? size || 0 : el.to_s.length }
    i = size
    arr = self
    while i > 0 do
      res = []
      arr.each do |el|
        el = (el.to_s =~ /\d/) ? el.to_s.rjust(size, "-") : el.to_s.ljust(size, "-")
        pos = ['-', *('0'..'9'), *('a'..'z')].index(el.split(/(.)/).reject(&:empty?)[i-1].downcase) || 0
        res[pos] ||= []
        el = (el.to_s =~ /\d/) ? el.gsub(/\-/, '').to_i : el.gsub(/\-/, '')
        res[pos] << el
      end
      arr = res.flatten.reject(&:nil?)
      i -= 1
    end 
    return (arr.empty?) ? self : arr 
  end

  private

  def merge left, right
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first > right.first
      [right.first] + merge(left, right[1..right.length])
    else
      [left.first] + merge(left[1..left.length], right)
    end
  end
end

# Samples of use
p [12, 1, 8, 6, 15, 18, 4, 9, 75, 15, 10, 2, 3, 5, 15].quick_sort
p [12, 1, 8, 6, 15, 18, 4, 9, 75, 15, 10, 2, 3, 5, 15].merge_sort
p [12, 1, 8, 6, 15, 18, 4, 9, 75, 15, 10, 2, 3, 5, 15].bubble_sort
p [12, 1, 8, 6, 15, 18, 4, 9, 75, 15, 10, 2, 3, 5, 15].insertion_sort
p [12, 1, 8, 6, 0, 15, 18, 115, 1117562, 4, 9, 75, 15, 10, 2, 3, 5, 15].counting_sort
p [12, 1, 8, 6, 15, 18, 115, 1117562, 4, 9, 75, 15, 10, 2, 3, 5, 15].radix_sort
p ['a', 'd', 'gg', 'global', 'cool', 'nice', 'wtf', 5, 8, 0].radix_sort