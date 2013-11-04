# -*- coding: binary -*-
require 'rex/post/meterpreter'

module Rex
module Post
module Meterpreter
module Ui

###
#
# Standard API extension.
#
###
class Console::CommandDispatcher::Jscrunner

	Klass = Console::CommandDispatcher::Jscrunner

	include Console::CommandDispatcher

	#
	# Options used by the 'run_sc' command.
	#
	@@shellcode_opts = Rex::Parser::Arguments.new(
		"-h" => [ true, "Help menu."  ]#, 
		#"-c" => [ false,  "Shellcode, <\\x44\\x45\\x46>" ]
                ) 
	#
	# Initializes an instance of the espia command interaction.
	#
	def initialize(shell)
		super
	end

	#
	# List of supported commands.
	#
	def commands
	{
			"run_sc"  => "Execute shellcode on the client",
	}
	end

	def cmd_run_sc( *args )
		
                sc_code = nil
		
		@@shellcode_opts.parse(args) { |opt, idx, val|
			case opt
				#when "-c"
				#	sc_code = val
				when "-h"
					print(@@shellcode_opts.usage)
					return true
			end
		}

		#Did we at least get an executable?
                sc_code = args[0]
		if (sc_code == nil)
			print_error("You must provide shellcode to run.")
			return true
		end

		info = client.jscrunner.run_sc(sc_code)
		print_line("#{info}")
		
		return true
	end

	#
	# Name for this dispatcher
	#
	def name
		"Java Shellcode Runner"
	end

end

end
end
end
end
