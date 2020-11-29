class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
    		t.string :first_name
    		t.string :last_name
    		t.string :class_name
      t.timestamps
    end
  end
end