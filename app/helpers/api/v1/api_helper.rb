module Api::V1::ApiHelper
  def json_envelope(json, status, code, pagination)
    json.status status
    json.code code if status == :error
    json.message json_error_msg(code) if status == :error
    json.data do
      yield if block_given?
    end
    if pagination
      json.pagination do
        json.current_page pagination[:current_page]
        json.total_pages pagination[:total_pages]
        json.total_items pagination[:total_items]
        json.items_per_page pagination[:items_per_page]
      end
    end
  end

  private
  def json_error_msg(code)
    case code
      when 1
        ''
      else 'error message'
    end
  end
end