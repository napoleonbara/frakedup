class CreateSignInTokens < ActiveRecord::Migration
  def change
    create_table :sign_in_tokens do |t|
      t.string :text

      t.timestamps
    end
  end
end
