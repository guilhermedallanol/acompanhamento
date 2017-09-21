module Resourceless
  def index
    assign_memoization(collection_instance, collection.decorate)
  end

  def new
    assign_memoization(object_instance, object_key.to_s.camelize.constantize.new)
  end

  def create
    result = collection_key.to_s.camelize.constantize::CreationService.perform(
      object_params, current_user
    )

    assign_memoization(object_instance, result.public_send(object_key))

    if result.success?
      redirect_to collection_path, notice: t(".success")
    else
      render :new
    end
  end

  def destroy
    assign_memoization(object_instance, collection.find(params[:id])).destroy

    redirect_to collection_path, notice: t('.success')
  end

  private

  def assign_memoization(instance, value)
    instance_variable_get(instance) || instance_variable_set(instance, value)
  end

  def object_key
    controller_name.singularize.to_sym
  end

  def object_instance
    "@#{object_key}".to_sym
  end

  def object_params
    params.require(object_key).permit(permitted_attributes)
  end

  def collection
    current_user.public_send(collection_key)
  end

  def collection_instance
    "@#{collection_key}".to_sym
  end

  def collection_key
    controller_name.to_sym
  end

  def collection_path
    public_send("#{collection_key}_path")
  end
end
