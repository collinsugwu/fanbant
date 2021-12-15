# frozen_string_literal: true

module Response
  def json_response(json_object, object = nil, status = :ok)
    render json: json_object, meta: pagination_dict(object)
  end
end
