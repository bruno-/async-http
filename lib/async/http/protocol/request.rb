# frozen_string_literal: true
#
# Copyright, 2017, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'protocol/http/request'
require 'protocol/http/headers'

require_relative '../body/writable'

module Async
	module HTTP
		module Protocol
			# Failed to send the request. The request body has NOT been consumed (i.e. #read) and you should retry the request.
			class RequestFailed < StandardError
			end
			
			# This is generated by server protocols.
			class Request < ::Protocol::HTTP::Request
				def connection
					nil
				end
				
				def hijack?
					false
				end
				
				def push?
					false
				end
				
				def peer
					if connection = self.connection
						connection.peer
					end
				end
				
				def remote_address
					@remote_address ||= peer.remote_address
				end
				
				def remote_address= value
					@remote_address = value
				end
			end
		end
	end
end
