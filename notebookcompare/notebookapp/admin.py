from django.contrib import admin
from notebookapp.models import Brand
from notebookapp.models import Model
from notebookapp.models import Specification
from notebookapp.models import Component


admin.site.register(Brand)
admin.site.register(Model)
admin.site.register(Specification)
admin.site.register(Component)
