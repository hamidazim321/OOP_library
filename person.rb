class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age, name='unknown', parent_permission=true)
    @id = id
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
  end

  private

  def of_age?
    return true if @age >= 18
    return false
  end

  public

  def can_use_services?
    return of_age? || @parent_permission
  end
end


