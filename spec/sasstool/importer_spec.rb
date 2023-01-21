require 'spec_helper'

describe Importer do
  subject { described_class.new({}) }

  describe '#imports' do
    context 'with scss' do
      let(:parent_path) { 'spec/fixtures/scss/main.scss' }
      let(:path) { 'dir/headings' }

      context 'with a regular path' do
        it 'returns a SassC::Importer::Import instance' do
          expect(subject.imports path, parent_path).to be_a SassC::Importer::Import
        end
      end

      context 'with a wildcard glob' do
        let(:path) { 'dir/*' }

        it 'returns an array of SassC::Importer::Import instancees' do
          result = subject.imports path, parent_path
          expect(result).to be_an Array
          expect(result.first).to be_a SassC::Importer::Import
        end
      end
    end

    context 'with sass' do
      let(:parent_path) { 'spec/fixtures/sass/main.sass' }
      let(:path) { 'dir/headings' }

      context 'with a regular path' do
        it 'returns a SassC::Importer::Import instance' do
          expect(subject.imports path, parent_path).to be_a SassC::Importer::Import
        end
      end

      context 'with a wildcard glob' do
        let(:path) { 'dir/*' }

        it 'returns an array of SassC::Importer::Import instancees' do
          result = subject.imports path, parent_path
          expect(result).to be_an Array
          expect(result.first).to be_a SassC::Importer::Import
        end
      end
    end
  end
end
