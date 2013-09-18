class SuperAdmin < AdminUser
  has_many :blogs

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def is_admin?
    true
  end
end
