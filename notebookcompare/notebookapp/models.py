from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Brand(models.Model):
	name = models.TextField(max_length=100)
	country = models.TextField(max_length=100)
	web = models.TextField(max_length=100)


class Specification (models.Model):
	type_specs = models.TextField(max_length=100)
	name = models.TextField(max_length=100)
	

class Model(models.Model):
	name = models.TextField(max_length=100)
	date = models.DateTimeField()
	price = models.IntegerField()
	brand = models.ForeignKey(Brand)
	specification = models.ManyToManyField(Specification)
	useradd = models.ForeignKey(User)
