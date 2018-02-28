class Group < ActiveRecord::Base
    belongs_to :user
    has_many :joins, dependent: :destroy
    has_many :users, through: :joins

    validates :name, presence: true, length: { minimum: 2 }
    validates :description, presence: true, length: { minimum: 2 }

end
