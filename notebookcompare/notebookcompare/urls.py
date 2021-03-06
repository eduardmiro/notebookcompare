from django.conf.urls import patterns, include, url
from notebookapp.views import *
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
from django.views.generic import DetailView, ListView, UpdateView
admin.autodiscover()
from notebookapp.views import APIBrandList, APIBrandDetail, APIModelList, APIModelDetail, APIComponentList, APIComponentDetail, APISpecificationList, APISpecificationDetail
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
    url(r'^brands/view/(?P<brand_name>\w+)/$', brand_detail , name='brand detail'),
    url(r'^brands/view/(?P<brand_name>\w+)/models/$', brand_models , name='brand models'),
    url(r'^brands/add/$', brands_add , name='add brand'),


	#MODELS
    url(r'^models/$', models , name='models'),
    url(r'^models/view/(?P<pk>\d+)/$', model_detail , name='model detail'),
    url(r'^models/add/$', model_add , name='add model'),
    url(r'^models/edit/(?P<pk>\d+)/$',UpdateView.as_view(model = Model,template_name = 'add_form_user.html',form_class = ModelFormEdit, success_url="/userpanel/my-laptops/"),name='laptop edit'),
    url(r'^models/delete/(?P<pk>\d+)/$', models_delete , name='delete model'),

	#COMPONENTS
    url(r'^components/$', components , name='components'),
    url(r'^components/view/(?P<pk>\d+)/$', component_detail , name='Component Detail'),
    url(r'^components/add/$', components_add , name='add component'),
    url(r'^components/edit/(?P<pk>\d+)/$',UpdateView.as_view(model = Component,template_name = 'add_form.html',form_class = EditComponent,success_url="/components/"),name='Component Edit'),


	#Specifications
    url(r'^specifications/$', specifications_detail_all , name='Specification Detail all'),
    url(r'^specifications/view/(?P<spec_id>\w+)/$', specifications_list , name='specifications list'),
    url(r'^specifications/add/$', specifications_add , name='add specification'),
    url(r'^specifications/edit/(?P<pk>\d+)/$',UpdateView.as_view(model = Specification,template_name = 'add_form.html',form_class = EditSpecification,success_url="/specifications/"),name='Specifications Edit'),

	#login user


    url(r'^login/$', 'django.contrib.auth.views.login'),
    url(r'^logout/$', logout_view),
    url(r'^register/$',register),
    url(r'^userpanel/$',userpanel),
    url(r'^userpanel/my-reviews/$',myreviews),
    url(r'^userpanel/my-laptops/$',mylaptops),

	#web 2.0
#reviews
    url(r'^review/$', review , name='review',),
    url(r'^review/(?P<model_id>\d)/view/$', review_model_view , name='view list of reviews'),
    url(r'^review/view/(?P<review_id>\d)/$', review_view , name='view review'),
    url(r'^review/(?P<model_id>\d)/add/$', review_model_add , name='review model'),
    url(r'^review/edit/(?P<pk>\d+)/$',UpdateView.as_view(model = Review,template_name = 'add_form_user.html',form_class = ReviewFormEdit, success_url="/userpanel/my-reviews/"),name='review edit'),
    url(r'^review/delete/(?P<pk>\d+)/$', review_delete , name='delete review'),

)

#RESTful
urlpatterns += patterns('',
    url(r'^api/brands/$', APIBrandList.as_view(), name='brand-list'),
    url(r'^api/brands/(?P<pk>\d+)/$', APIBrandDetail.as_view(), name='brand-detail'),
    url(r'^api/models/$', APIModelList.as_view(), name='model-list'),
    url(r'^api/models/(?P<pk>\d+)/$', APIModelDetail.as_view(), name='model-detail'),
    url(r'^api/components/$', APIComponentList.as_view(), name='component-list'),
    url(r'^api/components/(?P<pk>\d+)/$', APIComponentDetail.as_view(), name='component-detail'),
    url(r'^api/specifications/$', APISpecificationList.as_view(), name='specification-list'),
    url(r'^api/specifications/(?P<pk>\d+)/$', APISpecificationDetail.as_view(), name='specification-detail'),
)



