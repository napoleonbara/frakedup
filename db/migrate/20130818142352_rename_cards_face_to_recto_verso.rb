class RenameCardsFaceToRectoVerso < ActiveRecord::Migration
  def change
    rename_column :cards, :face_up, :recto
    rename_column :cards, :face_down, :verso
  end
end
