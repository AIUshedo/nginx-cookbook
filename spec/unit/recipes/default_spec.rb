#
# Cookbook:: uber_nginx_cookbook
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'uber_nginx_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should install nginx' do
      expect(chef_run).to install_package("nginx")
    end

    it 'nginx should be enabled' do
      expect(chef_run).to enable_service("nginx")
    end

    it 'nginx should be started' do
      expect(chef_run).to start_service("nginx")
    end

    it 'should create an nginx.conf template in etc/nginx' do
      expect(chef_run).to create_template("/etc/nginx/nginx.conf").with_variables(proxy_port: 7000)
    end

  end
end
