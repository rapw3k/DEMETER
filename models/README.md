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

# How to validate your data is compliant with AIM (particularly the domain layer)

* In order to make sure all elements are valid AIM elements you can use the json-ld playground: [https://json-ld.org/playground/](https://json-ld.org/playground/). 
This is not validating the semantics though, just that elements are resolvable.

* In order to validate the semantics, there are different tools we are evaluating still (and will provide some service).  
For now, you can : 
* use the online tool [https://shacl.org/playground/](https://shacl.org/playground/). However, this tool is not checking some restrictions (e.g., datetime format). New work was moved to library [https://github.com/zazuko/rdf-validate-shacl](https://github.com/zazuko/rdf-validate-shacl)
* use Apache Jena SHACL [https://jena.apache.org/documentation/shacl/](https://jena.apache.org/documentation/shacl/), e.g.,

```
./shacl v -s demeterAgriProfile-SHACL.ttl -d instance2-AIM.ttl
```

The SHACL definition for whole AIM domain layer is: [https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl](https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl)
