class CreationBaseService < Aldous::Service
  attr_reader :data

  def initialize(data, scope)
    @data  = data
    @scope = scope
  end

  def perform
    if model.save
      Result::Success.new(model_key => model)
    else
      Result::Failure.new(
        model_key => model,
        details: model.errors.full_messages.join(', ')
      )
    end
  end

  private

  def model
    @model ||= @scope.public_send(model_key.to_s.pluralize).new(@data)
  end
end
