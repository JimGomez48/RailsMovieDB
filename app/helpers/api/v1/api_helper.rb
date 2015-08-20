module Api::V1::ApiHelper
  def json_envelope(json, status, code)
    json.status status
    json.code code if status == 'error'
    json.message json_error_msg(code) if status == 'error'
    json.data do
      yield if block_given?
    end
  end

  private
  def json_error_msg(code)
    return 'error msg'
  end
end