local opts = {
	settings = {},
}
return {
	on_setup = function(server, global_config)
		server.setup(global_config(opts))
	end,
}
