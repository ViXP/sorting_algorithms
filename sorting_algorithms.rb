class Array
  # Quick Sort algorithm implementation
  def quick_sort
    return [] if size.zero?
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
      (1...length).each do
        self[i], self[i + 1] = self[i + 1], self[i] if self[i] > self[i + 1]
        i += 1
      end
    end
    self
  end

  # Insertion Sort algorithm implementation
  def insertion_sort
    i = 0
    (1...length).each do
      if self[i] > self[i + 1]
        self[i], self[i + 1] = self[i + 1], self[i]
        j = i
        while j.positive?
          self[j - 1], self[j] = self[j], self[j - 1] if self[j] < self[j - 1]
          j -= 1
        end
      end
      i += 1
    end
    self
  end

  # Counting Sort algorithm implementation
  def counting_sort
    intermed = []
    final = []
    each {|el| intermed[el] = intermed[el] ? intermed[el] + 1 : 1}
    intermed.each_with_index do |v, k|
      intermed[k] = k.positive? ? intermed[k - 1].to_i + v.to_i : v.to_i
    end.reject(&:nil?)
    each {|el| final[intermed[el]] = el}
    final.reject(&:nil?)
  end

  # Radix Sort algorithm implementation
  def radix_sort
    i = 0
    each do |el|
      i = (i || el.to_s.size.positive?) ? i || 0 : el.to_s.size
    end
    arr = self
    while i.positive?
      res = []
      arr.each do |el|
        if el.to_s =~ /\d/
          el = el.to_s.rjust(size, '-')
        else
          el = el.to_s.ljust(size, '-')
        end
        pos = ['-', *('0'..'9'), *('a'..'z')].index(el.split(/(.)/)
          .reject(&:empty?)[i - 1].downcase) || 0
        res[pos] ||= []
        el = (el.to_s =~ /\d/) ? el.gsub(/\-/, '').to_i : el.gsub(/\-/, '')
        res[pos] << el
      end
      arr = res.flatten.reject(&:nil?)
      i -= 1
    end
    arr.empty? ? self : arr
  end

  private

  def merge(left, right)
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
p [12, 1, 8, 6, 0, 15, 18, 115, 1_117_562, 4, 15, 10, 2, 3, 5, 15].counting_sort
p [12, 1, 8, 6, 15, 18, 115, 1_117_562, 4, 75, 15, 10, 2, 3, 5, 15].radix_sort
p ['a', 'd', 'gg', 'global', 'cool', 'nice', 'wtf', 5, 8, 0].radix_sort
