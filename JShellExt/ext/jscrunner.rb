#!/usr/bin/env ruby
# -*- coding: binary -*-

module Rex
module Post
module Meterpreter
module Extensions
module Jscrunner

###
#
# Standard ruby interface to remote entities for meterpreter.  It provides
# basic access to files, network, system, and other properties of the remote
# machine that are fairly universal.
#
###
class Jscrunner < Extension

	#
	# Initializes the privilege escalationextension.
	#
	def initialize(client)
		super(client, 'jscrunner')

		client.register_extension_aliases(
			[
				{
					'name' => 'jscrunner',
					'ext'  => self
				},
			])

	end

	#
	# Executes an application using the arguments provided
	#
	#
	def run_sc(arg1)
		request = Packet.create_request('jscrunner_execute')
		flags   = 0

		request.add_tlv( 67841, arg1 );

		response = client.send_request(request)

		return response.get_tlv_value( TLV_META_TYPE_STRING  | 1200 )		

	end
end

end; end; end; end; end
