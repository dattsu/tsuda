class CreateBblogs < ActiveRecord::Migration[5.2]
  def change
    create_table :bblogs do |t|
      t.string      :name
      t.text        :text
      t.timestamps
    end
  end
end
