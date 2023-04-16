local status, notify = pcall(require, "notify")
if not status then
	return
end

notify.setup({
	render = "minimal",
	stages = "static",
	fps = 60,
	timeout = 1000,
})
