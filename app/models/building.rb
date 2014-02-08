class Building < ActiveRecord::Base
  # Remember to create a migration!
  def self.get_taller_building(id_a,id_b)
    building_a = self.find(id_a)
    building_b = self.find(id_b)
    if building_a.height > building_b.height
      building_a
    elsif building_a.height < building_b.height
      building_b
    else
      "Tie"
    end
  end

  def get_taller_building(id_b)
    building_b = Building.find(id_b)
    if self.height > building_b.height
      self
    elsif self.height < building_b.height
      building_b
    else
      "Tie"
    end
  end
end
