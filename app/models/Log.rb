require_relative('../db/SqlRunner.rb')

class Log

  def self.action(category, message)
    sql = "INSERT INTO logs (category, message) VALUES ($1, $2)"
    values = [category, message]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM logs"
    SqlRunner.run(sql)
  end

end
