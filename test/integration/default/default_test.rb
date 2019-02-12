# # encoding: utf-8

# Inspec test for recipe uber_nginx_cookbook::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

describe service "nginx" do
  it { should be_running }
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end

# describe http("http://localhost:7000", enable_remote_worker: true) do
#   its('status') { should cmp 200 }
# end
