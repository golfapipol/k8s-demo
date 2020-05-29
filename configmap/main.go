package main

import (
	"io/ioutil"
	"log"

	"github.com/gin-gonic/gin"
	"gopkg.in/yaml.v2"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

type Config struct {
	Log struct {
		Level string `yaml:"level" json:"level"`
	} `yaml:"log" json:"log"`
	Mongo struct {
		Endpoint string `yaml:"endpoint" json:"endpoint"`
	} `yaml:"mongodb" json:"mongo"`
	Redis struct {
		Endpoint string `yaml:"endpoint" json:"endpoint"`
	} `yaml:"redis" json:"redis"`
}

func main() {
	dat, err := ioutil.ReadFile("/config/default.yml")
	check(err)

	var data Config
	yaml.Unmarshal(dat, &data)

	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"config": data,
		})
	})

	log.Fatal(r.Run())

}
