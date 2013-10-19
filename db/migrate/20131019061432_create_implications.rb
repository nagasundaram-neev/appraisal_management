class CreateImplications < ActiveRecord::Migration
  def change
    create_table :implications do |t|
    	t.text :name
      t.timestamps
    end
  end
end
