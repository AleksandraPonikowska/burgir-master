class Dictionary

  def initialize()
    @valid_words = File.readlines("sjp/slowa.txt").map(&:chomp)
  end

  def is_valid(word)
    @valid_words.include?(word)
  end

  def random_syllable
    word = @valid_words.sample
    syllable_index = rand(0..word.length - 3)
    word[syllable_index, 3]
  end
  
end
