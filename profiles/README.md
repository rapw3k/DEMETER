# AIM modular model resources

The AIM data model is published through a "normalisation" process where it is compared to the models it profiles and refactored into two forms:
* minimal - containing only constraints on base models, with a modular import of relevant profiles of base models
* flat - containing all relevant details extracted from referenced models.

On the basis of this, a suite of related artefacts are generated automatically:

* HTML documentation
* JSON-LD context 
* JSON-schema
* SHACL validation rules
* Profile model (documenting model relationships and resources available)
* others as required.

## Processing

The AIM models are profiled using "profilewiz", a python toolkit using the following steps:

1) Create a python virtual environment - eg one called 'profwiz' in a working directory

```python3 -m /someplace/venv/profwiz```

2) Activate virtual env - eg. /someplace/venv/profwiz/Scripts/activate

3) Install pyLODE customised for DEMETER:

```pip install git+https://github.com/rob-metalinkage/pyLODE.git```

4) Install Profilewiz:

``` pip install git+https://github.com/RDFLib/profilewiz.git```

5) cd {DEMETER git clone dir}/profiles

6) invoke profilewiz with the following arguments:

* 	-a (all artefacts)
* 	-n (normalise)
*	-q (use Qnames (short form))
*	-p lib/profile_cat.ttl
*	../models/*.ttl

'''
python -m profilewiz -a -q - -p lib/profile_cat.ttl ../models/*.ttl
'''


# See also
[https://github.com/RDFLib/profilewiz]()
