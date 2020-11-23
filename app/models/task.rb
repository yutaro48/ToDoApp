# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  date        :date             not null
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
    belongs_to :board
    belongs_to :user

    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true
end
