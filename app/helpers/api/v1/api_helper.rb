module Api::V1::ApiHelper
  def json_envelope(json, pagination)
    json.status 'success'
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
end