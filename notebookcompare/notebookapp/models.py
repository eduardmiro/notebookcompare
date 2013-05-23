from django.db import models
from django.contrib.auth.models import User
from datetime import date


# Create your models here.

class Brand(models.Model):
	name = models.CharField(max_length=120)
	country = models.CharField(max_length=30)
	web = models.CharField(max_length=100)
	pictureurl = models.CharField(max_length=100)
	def __unicode__ (self):
		return self.name

class Component(models.Model):
	name = models.CharField(max_length=30)
	def __unicode__ (self):
		return self.name

class Specification (models.Model):
	name = models.CharField(max_length=100)
	component = models.ForeignKey(Component)
	def __unicode__ (self):
		return self.component.name+" - " +self.name
	
class Model(models.Model):
	name = models.CharField(max_length=100)
	date = models.DateTimeField(auto_now_add=True)
	price = models.IntegerField()
	brand = models.ForeignKey(Brand)
	specification = models.ManyToManyField(Specification)
	useradd = models.ForeignKey(User)
	pictureurl = models.CharField(max_length=100)
	def __unicode__ (self):
		return self.name

class Review(models.Model):
	RATING_CHOICES = ((1, 'one'), (2, 'two'), (3, 'three'), (4, 'four'), (5, 'five'))
	rating= models.PositiveSmallIntegerField('Rating (stars)',blank=False,default=3,choices=RATING_CHOICES)
	comment=models.TextField(blank=True,null=True)
	user=models.ForeignKey(User)
	date=models.DateField(default=date.today)
	model=models.ForeignKey(Model)
	price_found=models.CharField(max_length=8,blank=True,null=True)
	shop_name=models.CharField(max_length=30,blank=True,null=True)
	shop_url=models.CharField(max_length=100,blank=True,null=True)
	def __unicode__ (self):
		return self.user




