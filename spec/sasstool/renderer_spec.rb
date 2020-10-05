require 'spec_helper'

describe Renderer do
  subject { described_class.new path }
  let(:path) { "spec/fixtures/scss/main.scss" }
  let(:target_dir) { "spec/tmp" }
  before { system "rm spec/tmp/main.css*" }

  describe '#save' do
    it "saves the css file" do
      subject.save target_dir
      expect(File.read "#{target_dir}/main.css").to match_approval "main_css"
    end

    it "saves the sourcemap file" do
      subject.save target_dir
      expect(File.read "#{target_dir}/main.css.map")
        .to match_approval("main_sourcemap")
        .except(/"mappings": ".*"/, '"mappings": "..."')
    end
  end
end
