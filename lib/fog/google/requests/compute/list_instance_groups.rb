module Fog
  module Compute
    class Google
      class Mock
        def list_instance_groups(zone_name)
          build_excon_response({
            "selfLink" => "https://www.googleapis.com/compute/#{api_version}/#{project}/zones/#{zone_name}/instanceGroups",
          })
        end
      end

      class Real
        def list_instance_groups(zone_name)
          api_method = @compute.instance_groups.list
          parameters = {
            'project' => @project,
            'zone' => zone_name
          }

          request(api_method, parameters)
        end
      end
    end
  end
end
