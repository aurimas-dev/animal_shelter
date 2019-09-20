require_relative('../db/SqlRunner.rb')

class Animal

  attr_reader :id, :owner_id
  attr_accessor :name, :type, :admission_date, :available_for_adoption

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @type = options['type']
    @admission_date = options['admission_date']
    @available_for_adoption = options['available_for_adoption']
    @owner_id = options['owner_id'].to_i() if options['owner_id']
  end

  def save()
    sql = "INSERT INTO animals (name, type, admission_date, available_for_adoption) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @type, @admission_date, @available_for_adoption]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE animals SET (name, type, admission_date, available_for_adoption, owner_id) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@name, @type, @admission_date, @available_for_adoption, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def assign_owner(owner_id)
    @owner_id = owner_id
    update()
  end

  def has_owner?()
    if (@owner_id != 0)
      return true
    end
    return false
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Animal.new(results.first())
  end

  def self.find_by_type(type)
    sql = "SELECT * FROM animals WHERE type = $1"
    values = [type]
    results = SqlRunner.run(sql, values)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.find_by_owner(owner_id)
    sql = "SELECT * FROM animals WHERE owner_id = $1"
    values = [owner_id]
    results = SqlRunner.run(sql, values)
    result = results.first()
    if (result != nil)
      return Animal.new(result)
    end
    return nil
  end

  def self.all_available_for_adoption()
    sql = "SELECT * FROM animals WHERE available_for_adoption = true"
    results = SqlRunner.run(sql)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.get_types()
    sql = "SELECT DISTINCT type FROM animals"
    results = SqlRunner.run(sql)
    return results.map() {|animal| animal["type"]}
  end

end
