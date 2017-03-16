class API::Root < Grape::API
  include API::V1
  add_swagger_documentation \
    info: {
      title: "TMF API",
      # description: "",
      # contact_name: "Xiaohui",
      # contact_email: "xiaohui@tanmer.com",
    }
end
