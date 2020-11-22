# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  deadline    :date             not null
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  boards_id   :bigint           not null
#
# Indexes
#
#  index_tasks_on_boards_id  (boards_id)
#
class Task < ApplicationRecord
    belongs_to :board
end
