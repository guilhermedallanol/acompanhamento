class WizardCreationBaseService < CreationBaseService

  private

  def model
    @model ||= @scope.public_send("build_#{model_key}", @data)
  end
end
