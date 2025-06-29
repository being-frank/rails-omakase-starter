require 'rails_helper'

SingleCov.covered! file: 'lib/host_config.rb'

RSpec.describe HostConfig do
  subject { described_class.new }

  describe '.app_name' do
    before do
      allow(Rails.application.class).to receive(:module_parent).and_return('RailsApp')
    end

    it { expect(subject.app_name).to eq('rails_app') }
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

  describe '.default_host' do
    context 'when APP_HOST has a single host' do
      it { expect(subject.default_host).to eq('test.host') }
    end

    context 'when APP_HOST has multiple hosts' do
      it do
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
    it do
      ClimateControl.modify PORT: '3000' do
        expect(subject.default_host_with_port).to eq('test.host:3000')
      end
    end
  end

  describe '.default_url_options' do
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

  # describe '#asset_host' do
  #   context 'when HostConfig::AssetSubdomain.nil?' do
  #     before do
  #       stub_const(asset_subdomain_const, nil)
  #     end

  #     it { expect(asset_subdomain_const.constantize).to be_nil }
  #     it { expect(subject.asset_host).to eq('test.host') }
  #   end

  #   context 'when HostConfig::AssetSubdomain.present?' do
  #     before do
  #       stub_const(asset_subdomain_const, :assets)
  #     end

  #     it { expect(asset_subdomain_const.constantize).to eq(:assets) }
  #     it { expect(subject.asset_host).to eq('assets.test.host') }
  #   end

  #   context 'when protocol: true' do
  #     before do
  #       stub_const(asset_subdomain_const, nil)
  #     end

  #     it { expect(subject.asset_host(protocol: true)).to eq('http://test.host') }
  #   end
  # end

  # describe '#cookie_domain' do
  #   context 'when !Rails.env.production?' do
  #     it { expect(subject.send(:test?)).to be(true) }
  #     it { expect(subject.cookie_domain).to eq(:all) }
  #   end

  #   context 'when Rails.env.production?' do
  #     before do
  #       allow(Rails.env).to receive(:production?).and_return(true)
  #     end

  #     it { expect(subject.cookie_domain).to eq('test.host') }
  #   end
  # end

  # describe '#default_url_options' do
  #   context 'when Rails.env.development?' do
  #     before do
  #       allow(Rails.env).to receive(:development?).and_return(true)
  #     end

  #     it { expect(subject.send(:development?)).to be(true) }

  #     context 'when not using overmind' do
  #       it do
  #         with_modified_env(OVERMIND_PORT: nil, PORT: '4400') do
  #           expect(subject.default_url_options).to eq({
  #             host:       'test.host',
  #             port:       '4400',
  #             protocol:   :http,
  #             tld_length: 1
  #           })
  #         end
  #       end
  #     end

  #     context 'when using overmind' do
  #       it do
  #         with_modified_env(OVERMIND_PORT: '4400') do
  #           expect(subject.default_url_options).to eq({
  #             host:       'test.host',
  #             port:       '4400',
  #             protocol:   :http,
  #             tld_length: 1
  #           })
  #         end
  #       end
  #     end
  #   end

  #   context 'when Rails.env.production?' do
  #     before do
  #       allow(Rails.env).to receive(:production?).and_return(true)
  #     end

  #     it { expect(subject.send(:production?)).to be(true) }

  #     it do
  #       expect(subject.default_url_options).to eq({
  #         host:       'test.host',
  #         protocol:   :https,
  #         tld_length: 1
  #       })
  #     end
  #   end
  # end

  # describe '#host' do
  #   it do
  #     with_modified_env(X_APP_HOST: 'example.com') do
  #       expect(subject.host).to eq('example.com')
  #     end
  #   end
  # end

  # describe '#host_protocol' do
  #   context 'when !force_ssl?' do
  #     it { expect(subject.host_protocol).to eq(:http) }
  #   end

  #   context 'when force_ssl?' do
  #     before do
  #       allow(Rails.env).to receive(:production?).and_return(true)
  #     end

  #     it { expect(subject.host_protocol).to eq(:https) }
  #   end
  # end

  # describe '#host_with_port' do
  #   context 'when Rails.env.development?' do
  #     before do
  #       allow(Rails.env).to receive(:development?).and_return(true)
  #     end

  #     it do
  #       with_modified_env(PORT: '3123') do
  #         expect(subject.host_with_port).to eq('test.host:3123')
  #       end
  #     end
  #   end

  #   context 'when Rails.env.production?' do
  #     before do
  #       allow(Rails.env).to receive(:production?).and_return(true)
  #     end

  #     it do
  #       with_modified_env(PORT: '3123') do
  #         expect(subject.host_with_port).to eq('test.host')
  #       end
  #     end
  #   end
  # end

  # describe '#port' do
  #   context 'when Rails.env.development?' do
  #     before do
  #       allow(Rails.env).to receive(:development?).and_return(true)
  #     end

  #     it { expect(subject.send(:development?)).to be(true) }

  #     it do
  #       with_modified_env(PORT: '3123') do
  #         expect(subject.port).to eq('3123')
  #       end
  #     end
  #   end

  #   context 'when Rails.env.production?' do
  #     before do
  #       allow(Rails.env).to receive(:production?).and_return(true)
  #     end

  #     it { expect(subject.send(:production?)).to be(true) }

  #     it do
  #       with_modified_env(PORT: '3123') do
  #         expect(subject.port).to be_nil
  #       end
  #     end
  #   end
  # end

  # describe '#tld_length' do
  #   context 'when TLD_LENGTH is not set' do
  #     it do
  #       with_modified_env(X_APP_HOST: 'domain.co.za') do
  #         expect(subject.tld_length).to eq(2)
  #       end
  #     end
  #   end

  #   context 'when TLD_LENGTH is set' do
  #     it do
  #       with_modified_env(TLD_LENGTH: '3') do
  #         expect(subject.tld_length).to eq(3)
  #       end
  #     end
  #   end
  # end

  # # ==== Hosts

  # describe '#apex_host' do
  #   it { expect(subject.apex_host).to eq('test.host') }
  # end

  # describe '#hosts' do
  #   context 'when HostConfig::Subdomains.nil?' do
  #     context 'when protocol: true' do
  #       it { expect(subject.hosts).to eq(%w[http://test.host]) }
  #     end

  #     context 'when protocol: false' do
  #       it { expect(subject.hosts(protocol: false)).to eq(%w[test.host]) }
  #     end
  #   end

  #   context 'when HostConfig::Subdomains.present?' do
  #     before do
  #       stub_const(subdomains_const, %i[www])
  #     end

  #     context 'when protocol: true' do
  #       it { expect(subject.hosts).to eq(%w[http://test.host http://www.test.host]) }
  #     end

  #     context 'when protocol: false' do
  #       it { expect(subject.hosts(protocol: false)).to eq(%w[test.host www.test.host]) }
  #     end
  #   end
  # end

  # describe '#wildcard_host' do
  #   it { expect(subject.wildcard_host).to eq('*.test.host') }
  # end

  # describe '#vite_host' do
  #   context 'when Rails.env.development?' do
  #     before do
  #       allow(Rails.env).to receive(:development?).and_return(true)
  #     end

  #     it { expect(subject.send(:development?)).to be(true) }
  #     it do
  #       with_modified_env(VITE_RUBY_PORT: '8082') do
  #         expect(subject.vite_host).to eq('test.host:8082')
  #       end
  #     end
  #   end

  #   context 'when protocol: true' do
  #     it do
  #       with_modified_env(VITE_RUBY_PORT: '8080') do
  #         expect(subject.vite_host(protocol: :ws)).to eq('ws://test.host:8080')
  #       end
  #     end
  #   end

  #   context 'when Rails.env.production?' do
  #     before do
  #       allow(Rails.env).to receive(:production?).and_return(true)
  #     end

  #     it { expect(subject.send(:production?)).to be(true) }
  #     it { expect(subject.vite_host).to be_nil }
  #   end
  # end
end
