class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :stripe_card_token
      t.references :user, index: true

      t.timestamps
    end
  end
end
