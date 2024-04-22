# Tests basic functionality of the Open Trivia Database API at https://opentdb.com/api_config.php.
RSpec.describe "Open Trivia Database API" do
  # OTD API has a rate limit of one call per 5 seconds.
  before(:each) do
    sleep(5)
  end

  describe "#get" do
    let(:response) { HTTParty.get(url) }
    context "when not provided with an amount" do
      let(:url) { "https://opentdb.com/api.php" }
      it "returns a 200 with no body not provided with a query" do
        expect(response.code).to eq(200)
        expect(response["content-length"]).to eq("0")
      end
    end
    context "when provided with an amount" do
      let(:amount) { Random.rand(1..10) }
      let(:url) { "https://opentdb.com/api.php?amount=#{amount}" }
      it "returns a 200 with the proper amount of questions" do
        expect(response.code).to eq(200)
        expect(response["response_code"]).to eq(0)
        expect(response["results"].size).to eq(amount)
      end
      it "returns questions which are formatted correctly" do
        response["results"].each do |question|
          expect(question).to be_instance_of(Hash)
          expect(question["type"]).to be_instance_of(String)
          expect(question["difficulty"]).to be_instance_of(String)
          expect(question["category"]).to be_instance_of(String)
          expect(question["question"]).to be_instance_of(String)
          expect(question["correct_answer"]).to be_instance_of(String)
          expect(question["incorrect_answers"]).to be_instance_of(Array)
        end
      end
    end
  end
end
