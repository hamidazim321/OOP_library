require_relative '../person'

describe 'testing the person class' do
  it 'initialize the person with age only' do
    person = Person.new(18)
    expect(person.age).to eq 18
    expect(person.name).to eq 'unknown'
    expect(person.parent_permission).to eq true
  end

  it 'should get correct name' do
    person = Person.new(25, 'John Doe')

    expect(person.correct_name).to eq 'John Doe'
  end
end
