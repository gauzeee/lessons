alphabet = "a".."z"

vowels_arr = ["a", "e", "i", "o", "u", "y"]

vowels_hash = {}

alphabet.each_with_index do |char, index|
  vowels_hash[index + 1] = char if vowels_arr.include?(char)
end

puts vowels_hash
