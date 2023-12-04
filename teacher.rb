require_relative 'person.rb'

class Teacher < Person
  def initialize(id, age, name='unknown', parent_permission=true, specialization)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end
  def can_use_services?
    true
  end
end
