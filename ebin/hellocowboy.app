{application, 'hellocowboy', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['hello_handler','hellocowboy_app','hellocowboy_sup']},
	{registered, [hellocowboy_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {hellocowboy_app, []}},
	{env, []}
]}.