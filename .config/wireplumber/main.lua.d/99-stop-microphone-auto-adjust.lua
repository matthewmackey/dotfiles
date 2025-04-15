-- From: https://www.linux.org/threads/prevent-applications-from-changing-microphone-gain.41636/

-- Restart after setting this file:
--   systemctl --user restart wireplumber pipewire pipewire-pulse
table.insert(default_access.rules, {
	matches = {
		{
			{ "application.process.binary", "=", "ferdium" },
		},
	},
	default_permissions = "rx",
})
