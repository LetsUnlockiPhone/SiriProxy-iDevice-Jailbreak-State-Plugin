require 'cora'
require 'siri_objects'
require 'json'
require 'httparty'
require 'nokogiri'

class SiriProxy::Plugin::Jailbreak < SiriProxy::Plugin

  def initialize(config)
    #process custom config
  end

	def get_jailbrake(device, version, ios)
		url = "http://www.letsunlockiphone.com/jailbreak.php?device=#{device}&version=#{version}&ios=#{ios}"
		page = HTTParty.get(path).body

		#parse and return content here

		#if page is in json format
		results = JSON.parse(page)

		#some logic here

		#and return
		results
	end

	listen_for /give me jailbreak(?: for)? (iphone|ipad|ipod) ([a-z0-9]*) with ios ([a-z0-9.]*)/i do |device, version, ios|

		results = get_jailbrake(device, version, ios)
		#say something
		say results

		request_completed
	end

	listen_for /give me jailbreak/i do
    		set_state :jail_search_state #set a state...
    	
	    	#say something about
    		say "give me more details about your device"
    
	    	request_completed
  	end

  	listen_for /(iphone|ipad|ipod) ([a-z0-9]*)(?: with)? ios ([a-z0-9.]*)/i, within_state: :jail_search_state do |device, version, ios|
    	
    		set_state nil

	    	results = get_jailbrake(device, version, ios)
		#say something
		say results
    	
    		request_completed
  	end
end