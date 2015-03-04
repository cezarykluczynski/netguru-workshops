class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    return self.user.firstname << " " << self.user.lastname
  end

end
