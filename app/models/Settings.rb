require_relative('./Animal.rb')
require_relative('./Owner.rb')

class Settings

  def self.help()
    return "help me out"
  end

  def self.animals()
    return Animal.all()
  end

end
