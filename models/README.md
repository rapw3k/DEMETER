# Domain Ontologies

This folder contains the modules comprising the AIM domain layer. 
The modules have been created by reusing well-known ontologies and models related to the agri-food sector, namely 
[Saref4Agri](https://mariapoveda.github.io/saref-ext/OnToology/SAREF4AGRI/ontology/saref4agri.ttl/documentation/index-en.html), 
[FOODIE](http://agroportal.lirmm.fr/ontologies/FOODIE) and 
[FIWARE agrifood models](https://github.com/FIWARE/data-models/tree/master/specs/AgriFood).
The modules include required extensions to cover DEMETER pilot's needs, as well as alignments between elements in these models.
The modules have been structured based on topics similar to the FIWARE agrifood models, but more in line with the underlying models.

# Examples

There are some examples of how to represent data that is compliant with the AIM. 
Please check examples at [https://github.com/rapw3k/DEMETER/tree/master/models/examples](https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld). In particular:

* instance-AIM.* is a valid instance example (which is mainly based on fiware elements), in json-ld and turtle respectively

* instance2-AIM.* is a valid instance of an extended version example (mainly based on FOODIE),  in json-ld and turtle respectively, but with invalid datetime values (so SHACL validation reports it)

* instance-bad-AIM.* and instance-bad2-AIM.* are examples that provide errors in SHACL validation

Note1: in the context I added the 10 individuals domain contexts; however in theory it should be possible to add just one: https://w3id.org/demeter/agri-context.jsonld which points to the all others, but in the json-ld playground this double refence is not processed)

# Finding terms and retrieving annotations 

Developers have different options to find terms in AIM:
* Load whole ontology in ontology editor like Protege [https://w3id.org/demeter/agri](https://w3id.org/demeter/agri), and then search for terms. This may be useful only for those having some basic experience with ontologies.
* All modules of AIM domain layer (e.g., [https://w3id.org/demeter/agri](https://w3id.org/demeter/agri), [https://w3id.org/demeter/agriCrop](https://w3id.org/demeter/agriCrop)) take you to OGC definiton server (using any content negotiation except from TURTLE and RDF/XML). From there you can search terms. However, currently the search is restricted to each module.
* AIM domain layer is available via agroPortal: [http://agroportal.lirmm.fr/ontologies/DEMETER-AIM](http://agroportal.lirmm.fr/ontologies/DEMETER-AIM). From there you can browse classes, properties or mappgins if any (e.g., [http://agroportal.lirmm.fr/ontologies/DEMETER-AIM?p=classes](http://agroportal.lirmm.fr/ontologies/DEMETER-AIM?p=classes). Additionally, you can use recommendations and annotator functionalities of the portal. These feature are also available via API:
	- *search for terms in AIM (e.g., Plot)*
[http://data.agroportal.lirmm.fr/search?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&q=plot](http://data.agroportal.lirmm.fr/search?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&q=plot)
	- *search for properties in AIM (e.g., hasAgriParcel)*
[http://data.agroportal.lirmm.fr/property_search?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&q=hasAgriParcel](http://data.agroportal.lirmm.fr/property_search?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&q=hasAgriParcel)
	- *get annotations (potential terms from AIM) given an input text (e.g., this parcel crop maize)*
[http://data.agroportal.lirmm.fr/annotator?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&text=this+parcel+crop+maize](http://data.agroportal.lirmm.fr/annotator?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&text=this+parcel+crop+maize)


# How to validate your data is compliant with AIM (particularly the domain layer)

* In order to make sure all elements are valid AIM elements you can use the json-ld playground: [https://json-ld.org/playground/](https://json-ld.org/playground/). 
This is not validating the semantics though, just that elements are resolvable.

* In order to validate the semantics, there are different tools we are evaluating still (and will provide some service).  
For now, you can : 
	- use the online tool [https://shacl.org/playground/](https://shacl.org/playground/). However, this tool is not checking some restrictions (e.g., datetime format). New work was moved to library [https://github.com/zazuko/rdf-validate-shacl](https://github.com/zazuko/rdf-validate-shacl)
	- use Apache Jena SHACL [https://jena.apache.org/documentation/shacl/](https://jena.apache.org/documentation/shacl/), e.g.,

```
./shacl v -s demeterAgriProfile-SHACL.ttl -d instance-AIM.ttl

@prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix sh:    <http://www.w3.org/ns/shacl#> .
@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .
@prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .

[ a            sh:ValidationReport ;
  sh:conforms  true
] .
```

```
./shacl v -s demeterAgriProfile-SHACL.ttl -d instance2-AIM.ttl

14:07:03 WARN  riot            :: [line: 18, col: 17] Lexical form '30/1/2019' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 19, col: 15] Lexical form '30/6/2019' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 29, col: 17] Lexical form '30/1/2020' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 30, col: 15] Lexical form '30/6/2020' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 40, col: 17] Lexical form '30/1/2019' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 41, col: 15] Lexical form '30/6/2019' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 51, col: 17] Lexical form '30/1/2020' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 52, col: 15] Lexical form '30/6/2020' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 103, col: 17] Lexical form '30/1/2010' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 116, col: 17] Lexical form '30/1/2015' not valid for datatype XSD dateTime
14:07:03 WARN  riot            :: [line: 138, col: 17] Lexical form '30/1/2000' not valid for datatype XSD dateTime
@prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix sh:    <http://www.w3.org/ns/shacl#> .
@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .
@prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .

[ a            sh:ValidationReport ;
  sh:conforms  true
] .
```

```
./shacl v -s demeterAgriProfile-SHACL.ttl -d instance-bad-AIM.ttl

12:21:26 WARN  riot            :: [line: 42, col: 21] Lexical form 'test-bad-pattern' not valid for datatype XSD dateTime
@prefix schema: <https://schema.org/> .
@prefix :      <https://w3id.org/cybele/> .
@prefix iso19150-2: <http://def.seegrid.csiro.au/isotc211/iso19150/-2/2012/basic#> .
@prefix owl:   <http://www.w3.org/2002/07/owl#> .
@prefix saref: <https://w3id.org/saref#> .
@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .
...
@prefix obo:   <http://purl.obolibrary.org/obo/> .

[ a            sh:ValidationReport ;
  sh:conforms  false ;
  sh:result    [ a                             sh:ValidationResult ;
                 sh:focusNode                  _:b0 ;
                 sh:resultMessage              "NodeKind[IRI] : Expected IRI for _:B66d4aa0b5957b34d9b0a078c73906ff9" ;
                 sh:resultSeverity             sh:Violation ;
                 sh:sourceConstraintComponent  sh:NodeKindConstraintComponent ;
                 sh:sourceShape                <https://astrea.linkeddata.es/shapes#cf6a37cc1bfa54fcde15de1df08c3452> ;
                 sh:value                      _:b0
               ] ;
  sh:result    [ a                             sh:ValidationResult ;
                 sh:focusNode                  _:b1 ;
                 sh:resultMessage              "NodeKind[IRI] : Expected IRI for _:Bc7453547e4aaccae34bc58d15866a0c8" ;
                 sh:resultSeverity             sh:Violation ;
                 sh:sourceConstraintComponent  sh:NodeKindConstraintComponent ;
                 sh:sourceShape                <https://astrea.linkeddata.es/shapes#cf6a37cc1bfa54fcde15de1df08c3452> ;
                 sh:value                      _:b1
               ]
] .
```

The SHACL definition for whole AIM domain layer is: [https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl](https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl)
