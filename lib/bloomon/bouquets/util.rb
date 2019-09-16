class String
  def is_number?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end

end
