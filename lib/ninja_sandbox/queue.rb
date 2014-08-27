require 'forwardable'

module NinjaSandbox
	class Queue
		extend Forwardable

		def initialize(q)
			@q = q
		end

		def_delegator :@q, :enqueue
	end
end