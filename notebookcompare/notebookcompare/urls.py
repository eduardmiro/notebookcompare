from django.conf.urls import patterns, include, url
from notebookapp.views import *
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

from django.conf.urls.defaults import *

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'notebookcompare.views.home', name='home'),
    # url(r'^notebookcompare/', include('notebookcompare.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', mainpage, name='home'),
	#BRANDS
    url(r'^brands/$', brands , name='brands'),
    url(r'^brands/(?P<brand_name>\w+)/$', brand_detail , name='brand detail'),
    url(r'^brands/(?P<brand_name>\w+)/models/$', brand_models , name='brand models'),
	#MODELS
    url(r'^models/$', models , name='models'),
    url(r'^models/(?P<model_name>[\w\-]+)/$', model_detail , name='model detail'),
	#COMPONENTS
    url(r'^components/$', components , name='components'),
    url(r'^components/(?P<comp_name>\w+)/$', component_detail , name='Component Detail'),
	#Specifications
    url(r'^specifications/$', specifications_detail_all , name='Specification Detail all'),
    url(r'^specifications/(?P<spec_id>\w+)/$', specifications_list , name='specifications list'),

	#login user
	#Specifications

    url(r'^login/$', 'django.contrib.auth.views.login'),
    url(r'^logout/$', logout_view),
    url(r'^register/$',register),


	#web 2.0
#reviews
    url(r'^review/$', review , name='review',),
    url(r'^review/(?P<model_id>\d)/view/$', review_model_view , name='view review model'),

    url(r'^review/view/(?P<review_id>\d)/$', review_view , name='view review'),


    url(r'^review/(?P<model_id>\d)/add/$', review_model_add , name='review model'),



)
