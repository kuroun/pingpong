class AddInitialScoreToUsers < SeedMigration::Migration
  def up
  	User.all.each do |u|
  		u.update_attribute(:score, 0)
  	end
  end

  def down

  end
end
