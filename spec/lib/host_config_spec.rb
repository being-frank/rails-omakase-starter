require 'rails_helper'

SingleCov.covered! file: 'lib/host_config.rb'

RSpec.describe HostConfig, order: :defined do
  subject { described_class.new }

  describe '.app_name' do
    before do
      allow(Rails.application.class).to receive(:module_parent).and_return('RailsAppName')
    end

    it { expect(subject.app_name).to eq('rails_app_name') }
  end

  describe '.asset_host_url' do
    context 'when ASSET_HOST_URL is not set' do
      it do
        expect(subject.asset_host_url).to eq('http://test.host')
      end
    end

    context 'when ASSET_HOST_URL is set' do
      it do
        ClimateControl.modify ASSET_HOST_URL: 'https://assets.test.host' do
          expect(subject.asset_host_url).to eq('https://assets.test.host')
        end
      end
    end
  end

  describe '.default_host' do
    context 'when APP_HOST has a single host' do
      it { expect(subject.default_host).to eq('test.host') }
    end

    context 'when APP_HOST has multiple hosts' do
      it 'is expected to return the first host (test.host2)' do
        ClimateControl.modify APP_HOST: 'test.host2,test.host' do
          expect(subject.default_host).to eq('test.host2')
        end
      end
    end

    context 'when APP_HOST is configured to have subdomains' do
      it do
        ClimateControl.modify APP_HOST: '.test.host' do
          expect(subject.default_host).to eq('test.host')
        end
      end
    end
  end

  describe '.default_host_with_port' do
    context 'when PORT is not set' do
      it do
        ClimateControl.modify PORT: nil do
          expect(subject.default_host_with_port).to eq('test.host')
        end
      end
    end

    context 'when PORT is set' do
      it do
        ClimateControl.modify PORT: '3000' do
          expect(subject.default_host_with_port).to eq('test.host:3000')
        end
      end
    end
  end

  describe '.default_url_options' do
    context 'when PORT is not set' do
      it do
        ClimateControl.modify PORT: nil do
          expect(subject.default_url_options).to eq({
            protocol:   :http,
            host:       'test.host',
            tld_length: 1
          })
        end
      end
    end

    context 'when PORT is set' do
      it do
        ClimateControl.modify PORT: '3000' do
          expect(subject.default_url_options).to eq({
            protocol:   :http,
            host:       'test.host',
            port:       '3000',
            tld_length: 1
          })
        end
      end
    end

    context 'when TLD_LENGTH is set' do
      it do
        ClimateControl.modify TLD_LENGTH: '2', APP_HOST: 'test.co.host' do
          expect(subject.default_url_options).to eq({
            protocol:   :http,
            host:       'test.co.host',
            tld_length: 2
          })
        end
      end
    end
  end

  describe '.hosts' do
    context 'when APP_HOST has a single host' do
      it do
        ClimateControl.modify APP_HOST: 'test.host' do
          expect(subject.hosts).to eq(%w[test.host])
        end
      end
    end

    context 'when APP_HOST has multiple hosts' do
      it do
        ClimateControl.modify APP_HOST: 'test.host2,test.host' do
          expect(subject.hosts).to eq(%w[test.host2 test.host])
        end
      end
    end

    context 'when APP_HOST is configured to have subdomains' do
      it do
        ClimateControl.modify APP_HOST: '.test.host' do
          expect(subject.hosts).to eq(%w[.test.host])
        end
      end
    end

    context 'when APP_HOST is not set' do
      it do
        ClimateControl.modify APP_HOST: nil do
          expect { subject.hosts }.to raise_error(HostConfig::Error, 'APP_HOST is not set')
        end
      end
    end
  end

  describe '.hosts_urls' do
    context 'when APP_HOST has a single host' do
      it do
        ClimateControl.modify APP_HOST: 'test.host' do
          expect(subject.hosts_urls).to eq(%w[http://test.host])
        end
      end
    end

    context 'when PORT is set' do
      it do
        ClimateControl.modify APP_HOST: 'test.host', PORT: '3000' do
          expect(subject.hosts_urls).to eq(%w[http://test.host:3000])
        end
      end
    end

    context 'when ssl_connection? is true' do
      before do
        allow(subject).to receive(:ssl_connection?).and_return(true)
      end

      it do
        ClimateControl.modify APP_HOST: 'test.host' do
          expect(subject.hosts_urls).to eq(%w[https://test.host])
        end
      end
    end

    context 'when APP_HOST has multiple hosts' do
      it do
        ClimateControl.modify APP_HOST: 'test.host2,test.host' do
          expect(subject.hosts_urls).to eq(%w[http://test.host2 http://test.host])
        end
      end
    end

    context 'when APP_HOST is configured to have subdomains' do
      it do
        ClimateControl.modify APP_HOST: '.test.host' do
          expect(subject.hosts_urls).to eq(%w[http://test.host])
        end
      end
    end
  end

  describe '.protocol' do
    context 'when ssl_connection? is false' do
      before do
        allow(subject).to receive(:ssl_connection?).and_return(false)
      end

      it do
        expect(subject.protocol).to eq(:http)
      end
    end

    context 'when ssl_connection? is true' do
      before do
        allow(subject).to receive(:ssl_connection?).and_return(true)
      end

      it do
        expect(subject.protocol).to eq(:https)
      end
    end
  end

  describe '.port' do
    context 'when PORT is not set' do
      it do
        expect(subject.port).to be_blank
      end
    end

    context 'when PORT is set' do
      it do
        ClimateControl.modify PORT: '3000' do
          expect(subject.port).to eq('3000')
        end
      end
    end
  end

  describe '.session_key' do
    before do
      allow(Rails.application.class).to receive(:module_parent).and_return('RailsAppName')
    end

    context 'when ssl_connection? is false' do
      before do
        allow(subject).to receive(:ssl_connection?).and_return(false)
      end

      it do
        expect(subject.session_key).to eq('_rails_app_name_session')
      end
    end

    context 'when ssl_connection? is true' do
      before do
        allow(subject).to receive(:ssl_connection?).and_return(true)
      end

      it do
        expect(subject.session_key).to eq('__Host-Http-rails_app_name_session')
      end
    end
  end

  describe '.tld_length' do
    context 'when TLD_LENGTH is not set' do
      it do
        expect(subject.tld_length).to eq(1)
      end
    end

    context 'when TLD_LENGTH is set' do
      it do
        ClimateControl.modify TLD_LENGTH: '2' do
          expect(subject.tld_length).to eq(2)
        end
      end
    end
  end

  describe '.vite_url' do
    context 'when the app is not deployed' do
      before do
        allow(subject).to receive(:deployed?).and_return(false)
        allow(ViteRuby).to receive(:config).and_return(double(protocol: :http, host: 'localhost', port: '5173'))
      end

      it { expect(subject.vite_url).to eq('http://localhost:5173') }
    end

    context 'when the app is deployed' do
      before do
        allow(subject).to receive(:deployed?).and_return(true)
      end

      it { expect(subject.vite_url).to be_nil }
    end

    context 'when protocol is provided' do
      before do
        allow(subject).to receive(:deployed?).and_return(false)
        allow(ViteRuby).to receive(:config).and_return(double(protocol: :http, host: 'localhost', port: '5173'))
      end

      it { expect(subject.vite_url(protocol: :ws)).to eq('ws://localhost:5173') }
    end
  end

  describe '.csp_connect_src' do
    context 'when deployed? is false' do
      before do
        allow(subject).to receive(:deployed?).and_return(false)
        allow(ViteRuby).to receive(:config).and_return(double(host: 'localhost', port: '5173'))
      end

      it { expect(subject.csp_connect_src).to eq('ws://localhost:5173') }
    end

    context 'when deployed? is true' do
      before do
        allow(subject).to receive(:deployed?).and_return(true)
      end

      it { expect(subject.csp_connect_src).to be_nil }
    end
  end

  describe '.csp_font_src' do
    it { expect(subject.csp_font_src).to eq('http://test.host') }
  end

  describe '.csp_img_src' do
    it { expect(subject.csp_img_src).to eq('http://test.host') }
  end

  describe '.csp_script_src' do
    it { expect(subject.csp_script_src).to eq('http://test.host') }
  end

  describe '.csp_style_src' do
    it { expect(subject.csp_style_src).to eq('http://test.host') }
  end

  describe 'private .to_uri' do
    it { expect(subject.send(:to_uri, 'http://test.host')).to eq('test.host') }
  end
end
