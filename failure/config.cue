package failure

import "github.com/davidovich/cue-bug/lib/entry"


// input: "filename": content
_input: [string]: entry.#hasParametersField

// comment the usage from the entry package and comment the equivalent
// below
//_parameters: {#in:_input} & entry.#nameFromFilename

// Toggle the following lines (which is a copy of the code in the `entry` package)
// to see the error

// uncomment start
#nameFromFilename: {
	for _name, _content in _input {
		{
			Name: _name
		} & _content.parameters // lift parameters to top level
	}
}
_parameters: {#in: _input} & #nameFromFilename
// uncomment end


#schema: {
	Name: string
	aField: *false | bool
	bField: string
}

_parameters & #schema

