require 'spec_helper'

describe Renderer do
  subject { described_class.new path }

  let(:target_dir) { 'spec/tmp' }

  before { system 'rm -f spec/tmp/main.css*' }

  describe '#save' do
    context 'with scss source' do
      let(:path) { 'spec/fixtures/scss/main.scss' }

      it 'saves the css file' do
        subject.save target_dir
        expect(File.read "#{target_dir}/main.css").to match_approval 'main_css'
      end

      it 'saves the sourcemap file' do
        subject.save target_dir
        expect(File.read "#{target_dir}/main.css.map")
          .to match_approval('scss_sourcemap')
          .except(/"mappings": ".*"/, '"mappings": "..."')
      end
    end

    context 'with sass source' do
      let(:path) { 'spec/fixtures/sass/main.sass' }

      it 'saves the css file' do
        subject.save target_dir
        expect(File.read "#{target_dir}/main.css").to match_approval 'main_css'
      end

      it 'saves the sourcemap file' do
        subject.save target_dir
        expect(File.read "#{target_dir}/main.css.map")
          .to match_approval('sass_sourcemap')
          .except(/"mappings": ".*"/, '"mappings": "..."')
      end
    end
  end
end
