class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :players

  def game_id
    self.object.id
  end

  def players
    self.object.users.map do |user|
      { username: user.username, chip_count: user.chip_count }
    end
  end
end
