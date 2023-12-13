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

  it 'Should return true on can_use_services? method if person if 18 or above or have parent permission otherwise false' do
    person1 = Person.new(23, 'John')
    person2 = Person.new(17, 'Max')
    person3 = Person.new(17, 'Floyd', parent_permission: false)

    expect(person1.can_use_services?).to be(true)
    expect(person2.can_use_services?).to be(true)
    expect(person3.can_use_services?).to be(false)
  end

  it 'Should return name on correct_name method' do 
    person = Person.new(22, 'Jake')

    expect(person.correct_name).to eq('Jake')
  end

  it "Should add rental a to the rental list on add_rental method" do
    fake_rental = {
      date: '12-23-22',
      book: 'Game Of Thrones'
    }
    person = Person.new(23, 'John')

    person.add_rental(fake_rental)

    expect(person.rentals).to include(fake_rental)
  end
end
