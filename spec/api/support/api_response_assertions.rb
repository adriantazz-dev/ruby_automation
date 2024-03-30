module APIResponseAssertions

    def expect_successful_response(response)
      expect(response[:message]).to eq("OK")
      expect(response).to include(:message_id)
    end

    # More assertions for api responses can be added here
  end
  