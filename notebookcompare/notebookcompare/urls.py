from django.conf.urls import patterns, include, url
from notebookapp.views import *
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()




urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'notebookcompare.views.home', name='home'),
    # url(r'^notebookcompare/', include('notebookcompare.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', mainpage, name='home'),
)
