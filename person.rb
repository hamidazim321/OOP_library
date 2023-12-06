require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
