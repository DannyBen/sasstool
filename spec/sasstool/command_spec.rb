require 'spec_helper'

describe Command do
  subject { CLI.router }

  let(:infile) { 'spec/fixtures/scss/main.scss' }
  let(:outdir) { 'spec/tmp' }

  before do
    ENV['SASSTOOL_OUTDIR'] = nil
    system "rm -f #{outdir}/main.css*"
    expect(File).not_to exist "#{outdir}/main.css"
    expect(File).not_to exist "#{outdir}/main.css.map"
  end

  context 'without arguments' do
    it 'shows help' do
      expect { subject.run }.to output_approval('cli/help')
    end
  end

  context 'with INFILE only' do
    context 'when the SASSTOOL_OUTDIR env var is empty' do
      it 'aborts with error' do
        expect { subject.run infile }.to raise_approval('cli/no_outdir')
      end
    end

    context 'when the SASSTOOL_OUTDIR env var is not empty' do
      before { ENV['SASSTOOL_OUTDIR'] = outdir }

      it 'saves the rendered CSS' do
        expect { subject.run infile }.to output("Saved\n").to_stdout
        expect(File).to exist "#{outdir}/main.css"
        expect(File).to exist "#{outdir}/main.css.map"
      end
    end
  end

  context 'with INFILE and OUTDIR' do
    it 'saves the rendered CSS' do
      expect { subject.run [infile, outdir] }.to output("Saved\n").to_stdout
      expect(File).to exist "#{outdir}/main.css"
      expect(File).to exist "#{outdir}/main.css.map"
    end
  end

  context 'with --watch' do
    let(:renderer) { double :renderer, save: nil }
    let(:glob) { 'spec/fixtures/scss/**/*.s[ca]ss' }
    let(:filewatcher) { Filewatcher.new(glob) }

    it 'watches and saves on change' do
      allow(Filewatcher).to receive(:new).with(glob).and_return(filewatcher)
      expect(Renderer).to receive(:new).twice.and_return(renderer)
      expect(renderer).to receive(:save).twice

      expect(filewatcher).to receive(:watch).and_yield

      subject.run [infile, outdir, '--watch']
    end
  end
end
