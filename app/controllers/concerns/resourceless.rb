module Resourceless
  include NewCreate

  def index
    instance_variable_set("@#{collection_key}".to_sym, collection.decorate)
  end

  def destroy
    instance_variable_set(object_instance, collection.find(params[:id])).destroy

    redirect_to after_destruction_path, notice: t('.success')
  end

  private

  def collection
    current_user.public_send(collection_key)
  end

  def collection_key
    controller_name.to_sym
  end

  def after_destruction_path
    after_creation_path
  end
end
