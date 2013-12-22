require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe OsxApp do

  subject { OsxApp.new(parameter) }

  context 'when using name of app' do
    context 'and app exist by default' do
      let(:parameter) { 'Automator' }

      its(:name) { should == 'Automator' }

      its(:path) { should == '/Applications/Automator.app' }
    end

    context 'with app suffix and app exist by default' do
      let(:parameter) { 'Automator.app' }

      its(:name) { should == 'Automator' }

      its(:path) { should == '/Applications/Automator.app' }
    end

    context 'and app does not exist' do
      let(:parameter) { 'Example' }

      it { expect { subject }.to raise_error(OsxApp::CannotFind) }
    end

    context 'with app suffix and app does not exist' do
      let(:parameter) { 'Example.app' }

      it { expect { subject }.to raise_error(OsxApp::CannotFind) }
    end
  end

  context 'when using path of app' do
    context 'and app exist by default' do
      let(:parameter) { '/Applications/Automator.app' }

      its(:name) { should == 'Automator' }

      its(:path) { should == '/Applications/Automator.app' }
    end

    context 'and app not exist' do
      let(:parameter) { '/Applications/Example.app' }

      it { expect { subject }.to raise_error(OsxApp::CannotFind) }
    end
  end
end
