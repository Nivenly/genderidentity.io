package grifts

import (
	"github.com/gobuffalo/buffalo"
	"github.com/nivenly/genderidentity/actions"
)

func init() {
	buffalo.Grifts(actions.App())
}
