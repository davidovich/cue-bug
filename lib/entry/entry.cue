package entry

// parameters is the top level field for the config params.
// Ensure we have the `parameters` field for every config.
#hasParametersField: {
	parameters: _
}

// extract config name from filename
#nameFromFilename: {
	#in: _

	for _name, _content in #in {
		{
			Name:    _name
		} & _content.parameters
	}
}
