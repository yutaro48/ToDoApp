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
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#
class Task < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :board
    has_many :comments, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true

    def comment_count
        comments.count
    end
end
