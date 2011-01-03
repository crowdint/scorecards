class CreateProfileSkill < ActiveRecord::Migration
  def self.up
    create_table :profile_skills do |t|
      t.integer :profile_id
      t.integer :skill_id
      t.integer :grade

      t.timestamps
    end
  end

  def self.down
    drop_table :profile_skills
  end
end
