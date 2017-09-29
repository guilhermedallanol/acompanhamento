class WizardCreationBaseService < CreationBaseService

  private

  def model
    @model ||= @scope.public_send("build_#{model_key.to_s}", @data)
  end
end
