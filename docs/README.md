# Agriculture Information Model (AIM)

The Agriculture Information Model (AIM) is a common vocabulary providing the basis for semantic interoperability across smart farming solutions. 
AIM defines the data elements, including concepts, properties and relationships relevant to agri applications, as well as their associated 
semantics/meaning for information exchange.  Built upon a thorough analysis of the related state of the art and practice, and driven by the elicited 
stakeholder requirements in DEMETER project, AIM aims to establish the basis of a common agricultural data space and enable the interoperability 
of different systems, potentially from different vendors. This will in turn enable the analysis of data produced by those systems in an integrated 
manner to make economically and environmentally sound decisions.

AIM has been designed following a layered and modular approach, and is realised as a suite of ontologies implemented in line with best practices, 
reusing existing standards and well-scoped dominant models as much as possible and establishing alignments between them to enable their interoperability 
and the integration of existing data. AIM is scalable and can be easily extended in order to address additional needs and incorporate new concepts, 
maintaining its consistency and compliance. In particular, AIM comprises the following layers:

* the meta-model layer defining the building blocks of AIM and enabling the back-and-forth conversion between datasets that are based on the property graph model and linked data datasets
* the cross-domain layer defining relevant concepts and properties that are common across multiple domains, and which enable the interoperability with existing standard models and vocabularies
* the domain layer defining agri-specific concepts and properties covering different aspects of interest of agri applications, and which enables the integration of relevant vocabularies in the sector.
* The pilot-specific layer defining additional concepts and properties that are of specific use for particular applications. 

Additionally, AIM defines a metadata model that can be used to describe datasets, services or applications in DEMETER.

The cross-domain module has been created by reusing and alignment existing standard ontologies/vocabularies, including: OGC/W3C sosa/ssn, OGC Geosparql, 
W3C Time ontology, W3C Data Cube ontology, ISO 191xx standards, WGS84, QUDT, W3C PROV-O, as well as well-known vocabularies like FOAF, Schema.org, and Dublin Core.

The domain modules have been created by reusing well-known ontologies and models related to the agri-food sector, namely the ETSI standard [Saref4Agri](https://saref.etsi.org/saref4agri/v1.1.2/) and the underlying Smart Applications REFerence [SAREF ontology](https://saref.etsi.org/core/v3.1.1/), 
[INPIRE/FOODIE ontology](http://agroportal.lirmm.fr/ontologies/FOODIE) and 
[SmartDataModel (aka.FIWARE) agrifood related models](https://smartdatamodels.org/).

A key value provided by AIM is that it harmonises and aligns relevant cross-domain standards with domain-specific models 
bridging various views on the agriculture data and providing a formal representation enabling unambiguous translations between them.

AIM is published as both human and implementation-ready machine-actionable resources, including the formal specifications as ontology modules (OWL ontologies), 
JSON-LD contexts enabling services to exchange AIM-compliant data based on the already successful JSON format, and SHACL shapes enabling the validation 
of data against AIM semantics. AIM specification includes guidelines on how to find and identify relevant terms, how to create AIM-based JSON-LD content, 
as well as instructions to validate the generated content.

AIM was originally developed as part of DEMETER project, and is being reused and extended in many ohter projects related to agriculture, but also in other 
domains (reusing the cross-domain layer).


> Version 3.0 of AIM has been released (03/2023). It includes:
* Re-alignment to FIWARE, now SmartDataModels, using latest models and the now official URIs
* Re-alignment to SAREF/SAREF4AGRI, using the latest, now official URIs
* Cleaned and moved the alignment to NGSI-LD from cross-domain layer to separate module, enabling the alignments of AIM with other meta-models in the future
* Re-use of key FOODON terms
* Re-use of key eCrop terms
* Improve documentation (adding labels and comments for each term)
* Cleaning and harmonization of terms definition
* Updated RDF/XML serialization based on official Turtle resources
* Updated JSON-LD contexts  
* Updated SHACL

## Ontology modules

* [DEMETER Agriculture Information Model (AIM) domain ontology](https://rapw3k.github.io/DEMETER/demeterAgriProfile/index-en.html)
* [AIM FarmAnimal](https://rapw3k.github.io/DEMETER/farmAnimal/index-en.html)
* [DEMETER core meta-model](https://rapw3k.github.io/DEMETER/demeterCore_ngsi-ld/index-en.html)
* [DEMETER Cross-Domain](https://rapw3k.github.io/DEMETER/cross-domain/index-en.html)
* [DEMETER AgriSystem](https://rapw3k.github.io/DEMETER/agriSystem/index-en.html)
* [DEMETER AgriProperty](https://rapw3k.github.io/DEMETER/agriProperty/index-en.html)
* [DEMETER AgriProduct](https://rapw3k.github.io/DEMETER/agriProduct/index-en.html)
* [DEMETER AgriPest](https://rapw3k.github.io/DEMETER/agriPest/index-en.html)
* [DEMETER AgriIntervention](https://rapw3k.github.io/DEMETER/agriIntervention/index-en.html)
* [DEMETER AgriFeature](https://rapw3k.github.io/DEMETER/agriFeature/index-en.html)
* [DEMETER AgriCrop](https://rapw3k.github.io/DEMETER/agriCrop/index-en.html)
* [AIM AgriCommon](https://rapw3k.github.io/DEMETER/agriCommon/index-en.html)
* [DEMETER AgriAlert](https://rapw3k.github.io/DEMETER/agriAlert/index-en.html)

## Examples

There are some examples of how to represent data that is compliant with the AIM. 
Please check examples at [https://github.com/rapw3k/DEMETER/tree/master/models/examples](https://github.com/rapw3k/DEMETER/tree/master/models/examples). In particular:

* simple-farm-instance-AIM_v3.* is a valid instance of a simple farm, in json-ld and turtle respectively
* complex-farm-instance-AIM_v3.* is a valid instance of an complex farm,  in json-ld and turtle respectively, but with invalid datetime values (so SHACL validation reports it)
* instance-bad*-AIM_v3.* are examples that provide errors in SHACL validation
* timeSeries-example1_v3.* is a valid instance to represent time series following sosa/ssn approach (cross-domain)

## Key terms

The three underlying models have concepts to represent a portion of land where crops or animals are grown, 
and since this is a major concept used in practically all agri applications, we include a [discussion of key terms](https://github.com/rapw3k/DEMETER/blob/master/models/README.md) that includes short definitions for them, and an explanaition of how they are aligned, so developers will be able to decide which one is more suited for their needs.

## Finding terms and retrieving annotations 

Developers have different options to find terms in AIM:
* Load whole ontology in ontology editor like Protege [https://w3id.org/demeter/agri](https://w3id.org/demeter/agri), and then search for terms. This may be useful only for those having some basic experience with ontologies.
* All modules of AIM domain layer (e.g., [https://w3id.org/demeter/agri](https://w3id.org/demeter/agri), [https://w3id.org/demeter/agri/agriCrop](https://w3id.org/demeter/agri/agriCrop)) take you to OGC definiton server (using any content negotiation except from TURTLE and RDF/XML). Also using OGC server you can search for terms in all AIM domain modules (cross-domain is not yet there) via [http://defs-dev.opengis.net/demeter/search](http://defs-dev.opengis.net/demeter/search). Also from OGC server many related resources are accessible via content-negotiation-by-profile, using the profile "alt" (linked from HTML views) - e.g. [https://w3id.org/demeter/agri/agriCrop?_profile=alt](https://w3id.org/demeter/agri/agriCrop?_profile=alt). These include JSON-LD schema, HTML documentation views, SHACL constraints and other resources. Use the issue tracker to highlight any issues with these. 
* AIM domain layer is available via agroPortal: [http://agroportal.lirmm.fr/ontologies/DEMETER-AIM](http://agroportal.lirmm.fr/ontologies/DEMETER-AIM). From there you can browse classes, properties or mappgins if any (e.g., [http://agroportal.lirmm.fr/ontologies/DEMETER-AIM?p=classes](http://agroportal.lirmm.fr/ontologies/DEMETER-AIM?p=classes). Additionally, you can use recommendations and annotator functionalities of the portal. These feature are also available via API:
	- *search for terms in AIM (e.g., Plot)*
[http://data.agroportal.lirmm.fr/search?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&q=plot](http://data.agroportal.lirmm.fr/search?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&q=plot)
	- *search for properties in AIM (e.g., hasAgriParcel)*
[http://data.agroportal.lirmm.fr/property_search?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&q=hasAgriParcel](http://data.agroportal.lirmm.fr/property_search?ontologies=http://data.agroportal.lirmm.fr/ontologies/DEMETER-AIM&q=hasAgriParcel)
	- *get annotations (potential terms from AIM) given an input text (e.g., I have a farm that has a parcel with a maize crop and a second parcel with a wheat crop)*
Try it via [http://agroportal.lirmm.fr/annotator](http://agroportal.lirmm.fr/annotator) (select AIM and optionally Agrovoc) or check results [here](http://services.agroportal.lirmm.fr/annotator/?text=I%20have%20a%20farm%20that%20has%20a%20parcel%20with%20a%20maize%20crop%20and%20a%20second%20parcel%20with%20a%20wheat%20crop&ontologies=AGROVOC,DEMETER-AIM&longest_only=false&exclude_numbers=false&whole_word_only=true&exclude_synonyms=false&expand_mappings=false&fast_context=false&certainty=false&temporality=false&experiencer=false&negation=false&score_threshold=0&confidence_threshold=0&display_links=false&display_context=false&apikey=1de0a270-29c5-4dda-b043-7c3580628cd5)


## How to create your JSON-LD content using AIM

JSON-LD is designed around the concept of a "context" to provide mappings from JSON to a shared/common model, allowing applications to use shortcut terms to communicate with one another more efficiently, but without losing accuracy.
The context links terms in a JSON document to elements in an ontology or vocabulary, i.e., AIM in the case of DEMETER.
So, in order to generate AIM-based JSON-LD content, you need to define the @context in your JSON document, and reference AIM context(s) from there.

In general, the simplest method is to specify just the main AIM context as below, which includes all terms in AIM (from the cross-domain and domain layer)

```
{
  "@context": "https://w3id.org/demeter/agri-context.jsonld",
  ....
}
```

Alternatively, you can use individual contexts, e.g., to use only few modules of AIM. Note that referencing the main context is the same as referencing all individual modules (including cross-domain and domain layer).
 

## How to validate your data is compliant with AIM (particularly the domain layer)

### syntactic and AIM terms validation

In order to make sure that all elements are valid AIM elements you can use the json-ld playground: [https://json-ld.org/playground/](https://json-ld.org/playground/). 

For instance, you can load one of the examples mentioned above in the JSON-LD Playground [here](https://tinyurl.com/y68qvhhv).

This is not validating the semantics though, just that elements are resolvable, and that your json-ld is syntactically 
correct.

Note: AIM context defines a default namespace that is used for those terms that are not found in AIM: https://w3id.org/demeter/default-context/ . Hence, if you identify terms in your applications that resolve to an URI starting with this 
namespace, consider searching for suitable terms from AIM.

### semantics validation

The goal of semantic validation is to allow developers of tools/services to validate that the produced/consumed data in their components is fully compliant with AIM semantics, reusing existing tools if possible.  

To achieve that, AIM provides [SHACL Shapes Graphs](https://www.w3.org/TR/shacl/). These shape graphs were generated from the AIM ontology (semi-automatically) using [Astrea Web Service](https://astrea.linkeddata.es/). The SHACL definition for the whole AIM domain layer is: [https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl](https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl)

Using the generated shapes, we can carry out the validation using existing tools. We found pySHACL [https://github.com/RDFLib/pySHACL](https://github.com/RDFLib/pySHACL) tool as the most complete solution, as it allows to specify not only the SHACL Shapes Graph that will be used for validation, but also an additional document (an ontology) containing extra ontological information to mix into the data graph used for validation, as well as the type of inference to run against the Data Graph before validating.

To use the validator, the following command should be used (see some examples below):
> pyshacl --imports -s https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl -e https://w3id.org/demeter/agri -i rdfs -a -j -df json-ld -f human mydata.jsonld


#### semantic validation examples
** validation using SHACL and all the semantics of AIM (specified in AIM ontology) **

```
./pyshacl --imports -s https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl -e https://w3id.org/demeter/agri -i rdfs -a -j -df json-ld -f human pilot5.2-afc-observation-point-simplified.jsonld
Validation Report
Conforms: True
```
** validation using SHACL but withoug incuding all the semantics of AIM (without using the AIM ontology) **
```
./pyshacl --imports -s https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl -i rdfs -a -j -df json-ld -f human pilot5.2-afc-observation-point-simplified.jsonld
Validation Report
Conforms: False
Results (1):
Constraint Violation in ClassConstraintComponent (http://www.w3.org/ns/shacl#ClassConstraintComponent):
	Severity: sh:Violation
	Source Shape: <https://astrea.linkeddata.es/shapes#3f6891594ac2d163a004bec00f8db48a>
	Focus Node: <http://www.w3id.org/afarcloud/poi?lat=45.75&amp;long=4.85>
	Value Node: <http://www.w3id.org/afarcloud/pCoord?lat=45.75&amp;long=4.85>
	Result Path: geo:hasGeometry
	Message: Value does not have class geo:Geometry
```
Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
