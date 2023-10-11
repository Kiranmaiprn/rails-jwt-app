require 'faraday'


class FaradayApi
    include faraday
    def self.post_employee
        params = {employee: { email: "kiran@gmail.com", role: "ur_software_engineer", password: 123456, name: "kiranmai"}}
        headers = {Content-Type => 'application/json'}
        response = Faraday.post "localhost:3001", params, headers
        response
    end
end