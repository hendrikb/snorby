require 'test_helper'

class IpTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  # this is just a basic test, it should probably respect NumericIPAddr
  test "create ipv4 from database representation" do
	ip = Ip.create()
	ip.ip_dst=IPAddr.new 2130706433, Socket::AF_INET
	assert ip.ip_dst.eql?(IPAddr.new("127.0.0.1"))
  end
  
  # this is just a basic test, it should probably respect NumericIPAddr
  test "create ipv6 from database representation" do
	ip = Ip.create()
	ip.ip_dst=IPAddr.new 85060714218195519117058029889198843855, Socket::AF_INET6
	assert ip.ip_dst.eql?(IPAddr.new("3ffe:1900:4545:3:200:f8ff:fe21:67cf"))
  end
end
