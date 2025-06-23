class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true, length: { maximum: 50 }
  validates :place,presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 2000 } 
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_at_should_be_before_end_at
  # validatesは、モデルの属性に対して標準的なバリデーションを定義するために使用されます
  # validateメソッドは、モデルの属性に対してカスタムバリデーションを定義するために使用されます

  private

  def start_at_should_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, 'は終了日時より前でなければなりません')
    end
  end
end
