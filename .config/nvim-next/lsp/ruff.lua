return {
	on_attach = function(client, _)
		-- Disable hover in favour of basedpyright
		client.server_capabilities.hoverProvider = false
	end,
}
