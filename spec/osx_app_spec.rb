require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe OsxApp do

  subject { OsxApp.new(parameter) }

  context 'when using name of app' do
    context 'and app exist by default' do
      let(:parameter) { 'Automator' }

      its(:name) { should == 'Automator' }

      its(:path) { should == '/Applications/Automator.app' }

      its(:version) { should == expected_automator_version }

      its(:version_major) { should == expected_automator_version_major }

      its(:minimum_osx) { should == expected_automator_minimum_osx }
    end

    context 'with app suffix and app exist by default' do
      let(:parameter) { 'Automator.app' }

      its(:name) { should == 'Automator' }

      its(:path) { should == '/Applications/Automator.app' }

      its(:version) { should == expected_automator_version }

      its(:version_major) { should == expected_automator_version_major }

      its(:minimum_osx) { should == expected_automator_minimum_osx }
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

      its(:version) { should == expected_automator_version }

      its(:version_major) { should == expected_automator_version_major }

      its(:minimum_osx) { should == expected_automator_minimum_osx }
    end

    context 'and app not exist' do
      let(:parameter) { '/Applications/Example.app' }

      it { expect { subject }.to raise_error(OsxApp::CannotFind) }
    end

    context 'and app does not contain Info.plist' do
      let(:parameter) { "/tmp/Example#{Random.new_seed}.app" }
      before { FileUtils.mkdir(parameter) }
      after  { FileUtils.rm_rf(parameter) }

      it { expect { subject }.to raise_error(OsxApp::Invalid) }
    end
  end

  def osx_version
    @osx_version ||= `sw_vers -productVersion`.strip
  end

  def expected_automator_version
    {
      '10.8.5' => '2.3'
    }[osx_version]
  end

  def expected_automator_version_major
    expected_automator_version.split('.').first
  end

  def expected_automator_minimum_osx
    {
      '10.8.5' => '10.7'
    }[osx_version]
  end
end
