class ApplicationService
  def self.call(...)
    new(...).call
  end

  def call
    raise NotImplementedError
  end
end
