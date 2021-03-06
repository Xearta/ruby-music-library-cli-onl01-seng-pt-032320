module Concerns::Findable
  def find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      new_song = self.create(name)
    end
  end
end
