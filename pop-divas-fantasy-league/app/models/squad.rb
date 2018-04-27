class Squad < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :back_up_singer_1, :back_up_singer_2
end
