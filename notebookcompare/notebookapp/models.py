from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Country(models.Model):
	name = models.TextField(max_length=30)
	def __unicode__ (self):
		return self.name

class Brand(models.Model):
	name = models.TextField(max_length=100)
	country = models.ForeignKey(Country)
	web = models.TextField(max_length=100)
	def __unicode__ (self):
		return self.name

class Component(models.Model):
	name = models.TextField(max_length=30)
	def __unicode__ (self):
		return self.name

class Specification (models.Model):
	name = models.TextField(max_length=100)
	component = models.ForeignKey(Component)
	def __unicode__ (self):
		return self.component.name+" - " +self.name
	
class Model(models.Model):
	name = models.TextField(max_length=100)
	date = models.DateTimeField()
	price = models.IntegerField()
	brand = models.ForeignKey(Brand)
	specification = models.ManyToManyField(Specification)
	useradd = models.ForeignKey(User)
	def __unicode__ (self):
		return self.name
