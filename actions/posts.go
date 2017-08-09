package actions

import (
	"github.com/gobuffalo/buffalo"
	"github.com/markbates/pop"
	"github.com/nivenly/genderidentity/models"
)

type PostsResource struct {
	buffalo.Resource
}

func (v PostsResource) List(c buffalo.Context) error {
	tx := c.Value("tx").(*pop.Connection)
	posts := &models.Posts{}
	err := tx.Order("lower(title) asc").All(posts)
	if err != nil {
		return err
	}
	c.Set("posts", posts)
	return c.Render(200, r.HTML("posts/index.html"))
}

func (v PostsResource) New(c buffalo.Context) error {
	c.Set("post", &models.Post{})
	return c.Render(200, r.HTML("posts/new.html"))
}

func (v PostsResource) Create(c buffalo.Context) error {
	t := &models.Post{}
	err := c.Bind(t)
	if err != nil {
		return err
	}

	tx := c.Value("tx").(*pop.Connection)
	verrs, err := tx.ValidateAndCreate(t)
	if err != nil {
		return err
	}
	if verrs.HasAny() {
		c.Set("post", t)
		c.Set("errors", verrs.Errors)
		return c.Render(422, r.HTML("posts/new.html"))
	}
	c.Flash().Add("success", "Post was created successfully")
	return c.Redirect(301, "/posts")
}

func (v PostsResource) Update(c buffalo.Context) error {
	tx := c.Value("tx").(*pop.Connection)
	t := &models.Post{}
	err := tx.Find(t, c.Param("post_id"))
	if err != nil {
		return err
	}
	err = c.Bind(t)
	if err != nil {
		return err
	}
	err = tx.Update(t)
	if err != nil {
		return err
	}

	c.Set("post", t)
	return c.Render(200, r.Template("text/javascript", "posts/update.js"))
}
