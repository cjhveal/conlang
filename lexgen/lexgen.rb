require 'yaml'

class Lexgen
  def self.from_file filename
    file =  YAML.load_file filename
    self.new file
  end

  def initialize options
    @patterns = options["patterns"]
    @groups = options["groups"]
  end

  def generate_lexeme
    pat = @patterns.sample
    phonemes = pat.split(//).map do |g|
      @groups[g].sample
    end
    phonemes.join('')
  end

  def generate n=1
    (1..n).map { generate_lexeme }
  end

end

gen = Lexgen.from_file 'charmid.yml'

puts gen.generate 100
