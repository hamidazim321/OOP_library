require_relative '../nameable'

describe Nameable do
  context "Initialize Nameable" do 
    it "Should Raise NotImplementError on method correct_name" do
      nameable = Nameable.new
      
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end