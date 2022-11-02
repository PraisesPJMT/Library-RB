class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class.name} has not implemented method '#{__method__}'"
  end
end
