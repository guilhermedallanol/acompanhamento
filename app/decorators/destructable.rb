module Destructable
  def destroy_link
    h.link_to 'Excluir', object,
      method: :delete,
      data: { confirm: delete_confirmation_message }
  end

  private

  def delete_confirmation_message
    I18n.t(
      :confirm_deletion,
      scope: object.model_name.i18n_key,
      default: :confirm_deletion
    )
  end
end
