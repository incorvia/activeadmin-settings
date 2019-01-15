migration_class =
  if ActiveRecord::VERSION::MAJOR >= 5
    ActiveRecord::Migration[4.2]
  else
    ActiveRecord::Migration
  end

class CreateSettings < migration_class
  def change
    create_table :settings do |t|
      t.string  :name
      t.text    :string
      if defined?(Paperclip)
        t.attachment :file
      elsif defined?(CarrierWave)
        t.string :file
      end

      t.timestamps
    end
  end
end
