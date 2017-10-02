module NewCreate
  def new
    scope
    instance_variable_set(
      object_instance,
      object_key.to_s.camelize.constantize.new
    )
  end

  def create
    result = controller_name.camelize.constantize::CreationService.perform(
      object_params, scope
    )

    instance_variable_set(object_instance, result.public_send(object_key))

    if result.success?
      redirect_to after_creation_path, notice: t(".success")
    else
      render :new
    end
  end

  private

  def object_key
    controller_name.singularize.to_sym
  end

  def object_instance
    "@#{object_key}".to_sym
  end

  def object_params
    params.require(object_key).permit(permitted_attributes)
  end

  def after_creation_path
    root_path
  end

  def scope
    current_user
  end
end
