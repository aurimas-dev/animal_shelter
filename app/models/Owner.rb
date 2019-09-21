require_relative('../db/SqlRunner.rb')
require_relative('./Animal.rb')

class Owner

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO owners (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE owners SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def get_owned_animal()
    return Animal.find_by_owner(@id)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    result = results.first()
    if (result != nil)
      return Owner.new(result)
    end
    return nil
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map() {|owner| Owner.new(owner)}
  end

  def self.all_available()
    owners = Owner.all()
    return owners.select() {|owner| owner.get_owned_animal() == nil}
  end

end
