module Twitter
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api
    resource :statuses do
      desc "Test Method 1"
      params do
        requires :values, type: Array, coerce_with: ->(val) { val.split(/\s+/).map(&:to_i) }
      end
      get :test_1 do
        params[:values]
      end

      desc 'Test Method 2'
      params do
        requires :values, type: Array[Integer], coerce_with: ->(val) { val.split(/\s+/).map(&:to_i) }
      end
      get :test_2 do
        params[:values]
      end
    end
  end
end
