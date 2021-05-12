class Note < ApplicationRecord
  has_many :note_users, dependent: :destroy
  has_many :users, through: :note_users, validate: false
  has_many :items, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  with_options presence: true do
    validates :character, uniqueness: { case_sensitive: false }
    validates :password
    validates :owner
    validates :list_name
    validates :log_name
    validates :reserve_name
    validates :item_name
  end
  validates :genre_id, numericality: { other_than: 0 } 
end