require_relative '../decorator'
class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end

describe Decorator do
  context "Initialize Decorator" do 
    it "Should call the correct_name method of the given Nameable on calling correct_name" do 
      nameable = double("Nameable")
      allow(nameable).to receive(:correct_name).and_raise(NotImplementedError)

      decorator = Decorator.new(nameable)

      expect{ decorator.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
