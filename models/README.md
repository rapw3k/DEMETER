# Domain Ontologies

This folder contains the modules comprising the AIM domain layer. 
The modules have been created by reusing well-known ontologies and models related to the agri-food sector, namely 
[Saref4Agri](https://mariapoveda.github.io/saref-ext/OnToology/SAREF4AGRI/ontology/saref4agri.ttl/documentation/index-en.html), 
[FOODIE](http://agroportal.lirmm.fr/ontologies/FOODIE) and 
[FIWARE agrifood models](https://github.com/FIWARE/data-models/tree/master/specs/AgriFood).
The modules include required extensions to cover DEMETER pilot's needs, as well as alignments between elements in these models.
The modules have been structured based on topics similar to the FIWARE agrifood models, but more in line with the underlying models.

> Version 2.0 of AIM has been released. It includes:
* Cross-domain ontology finalized
* Full alignment of cross-domain and domain layers
* JSON-LD context for cross-domain layer 
* Besides updated JSON-LD contexts for each domain module, one flat and normalized JSON-LD context including all terms of the cross-domain and domain layer 
* Updated SHACL
* Updated examples

# Examples

There are some examples of how to represent data that is compliant with the AIM. 
Please check examples at [https://github.com/rapw3k/DEMETER/tree/master/models/examples](https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld). In particular:

* instance-AIM_v2.* is a valid instance example (which is mainly based on fiware elements), in json-ld and turtle respectively

* instance2-AIM_v2.* is a valid instance of an extended version example (mainly based on FOODIE),  in json-ld and turtle respectively, but with invalid datetime values (so SHACL validation reports it)

* instance-bad-AIM_v2.* and instance-bad2-AIM_v2.* are examples that provide errors in SHACL validation

> Note1: previous examples have been moved to v1.0 folder, and json-ld examples have been slightly modified to include the cross-domain context. 
> Note2: to understand how to use DEMETER AIM context(s) see section "How to create your JSON-LD content using AIM" below.

#### Discussion of key terms (when to use which)
The three underlying models have concepts to represent a portion of land where crops or animals are grown, 
and since this is a major concept used in practically all agri applications, we provide here short 
definitions for them, and how they are aligned, so developers will be able to decide which one is 
more suited for their needs.

```
- Saref4Agri:Farm = inspire:Holding = fiware:AgriFarm (Level 1)

(saref4agri) A plot of land used for the scope of farming which can contain buildings and parcels. (JSON-LD concept: Farm)
(inspire) The whole area and all infrastructures included on it, covering the same or different sites, 
under the control of an operator to perform agricultural or aquaculture activities. (JSON-LD concept: Holding)
(fiware) Harmonised description of a generic farm made up of buildings and parcels. 
This entity is primarily associated with the agricultural vertical and related IoT applications. (JSON-LD concept: AgriFarm)

From FAO: The holding or farm is all the land being utilized in full or in part for agricultural purposes which is located in a single parish. 
The holding or farm may consist of one parcel of land or may be in several parcels. Where it comprises several parcels all parcels must be located 
within the same parish to be considered a single farm. Where parcels are located in several parishes, there will be as many farms as parishes. 
Where a holding straddles (i.e. on the border of) two parishes, the parish where the house/residence or the headquarters is located is to be regarded 
as the parish of location. A farm may comprise land in crops or it may be animals only. Where there are animals only, and no land dedicated to 
their rearing these are referred to as landless farms.

- inspire/foodie:Site (Level 2 - LPIS) (JSON-LD concept: Site)

(inspire/foodie) All land at the same or distinct geographic location under the management control of a holding covering activities, 
products and services. This includes all infrastructure, equipment and materials.
Land area used for a type of activity, e.g., arable land, grassland and vineyards. In particular NACE code, 
e.g., A1.1.1 - Growing of cereals (except rice), leguminous crops and oil seeds. 
LPIS data may be imported on the level of <Site> feature which is equal to LPIS farmer's block level.

- Saref4Agri:Parcel = foodie:Plot = fiware:AgriParcel (Level 3)

(saref4Agri) An area of land, which might be used for grazing animals or planting crops. The parcel is defined as an undividable logical 
area of land which contains homogeneous items (JSON-LD concept: Parcel)
(foodie) A continuous area of agricultural land with one type of crop species, cultivated by one user in one farming mode 
(conventional vs. transitional vs. organic farming) (JSON-LD concept: Plot)
(fiware) Harmonised description of a generic parcel of land. This entity is primarily associated with the agricultural vertical 
and related IoT applications." (JSON-LD concept: AgriParcel)

- foodie:ManagementZone (Level 4) (JSON-LD concept: ManagementZone)

(foodie) A spatial subset of a <Plot> that has specific properties like electric conductivity, organic matter, pH, soil texture, soil type or soil nutrients 
```

Additionally, to represent the geographical area associated to the land, the following properties are used

```
- wgs84_pos:location (generally used to associate countries/regions/municipalities where the land is located) (JSON-LD property: location)

The relation between something and the point, or other geometrical thing in space, where it is.
The range is SpatialThing - anything with spatial extent, i.e. size, shape, or position. e.g. 
people, places, bowling balls, as well as abstract areas like cubes.
For instance, geonames features (countries/regions) like Poznan (https://sws.geonames.org/3088171/) are subclasses of SpatialThing (gn:Feature subclassOf SpatialThing)

- geosparql:hasGeometry (generally used to associate a geometry, e.g., polygon to the land) (JSON-LD property: hasGeometry)

A spatial representation for a given feature.
The range is a Geometry (e.g., Point, Polygon, MultiPolygon, etc.), which has associated the serialization of the geometry, 
typically using the property asWKT to provide the WKT serialization e.g., POLYGON((15.54 50.61,14.14 49.02,17.12 48.32,19.06 49.59,19.76 51.60,15.54 50.61))

- fiware:location (JSON-LD property: locationGeoJson) and fiware:landLocation (JSON-LD property: landLocation) - preferable not used to facilitate interoperability and linked data publication

(location) The geo:json encoded polygon / multi-polygon describing this [entity]. Range is equivalent to GeoProperty
(landLocation). Geometry defining the boundaries of the farm land. Range is equivalent to GeoProperty

```

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


# How to create your JSON-LD content using AIM

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

Alternatively, you can use individual contexts, e.g., to use only few modules of AIM. Note that referencing the main context is the same as referencing all individual modules (including cross-domain and domain layer) as shown below:
 
```
{
  "@context": [
      "https://w3id.org/demeter/agri/crossDomain-context.jsonld",
    	"https://w3id.org/demeter/agri/agriFeature-context.jsonld",
			"https://w3id.org/demeter/agri/agriCrop-context.jsonld",
			"https://w3id.org/demeter/agri/agriCommon-context.jsonld",
			"https://w3id.org/demeter/agri/agriIntervention-context.jsonld",
			"https://w3id.org/demeter/agri/agriAlert-context.jsonld",
			"https://w3id.org/demeter/agri/agriProduct-context.jsonld",
			"https://w3id.org/demeter/agri/agriProperty-context.jsonld",
			"https://w3id.org/demeter/agri/agriSystem-context.jsonld",
			"https://w3id.org/demeter/agri/agriPest-context.jsonld",
			"https://w3id.org/demeter/agri/farmAnimal-context.jsonld"
   ],
   ...
}
```

# How to validate your data is compliant with AIM (particularly the domain layer)

* In order to make sure all elements are valid AIM elements you can use the json-ld playground: [https://json-ld.org/playground/](https://json-ld.org/playground/). 
This is not validating the semantics though, just that elements are resolvable.

* In order to validate the semantics, there are different tools we are evaluating still.
The goal is to provide a service for validation, which developers will be able to use from their components, reusing existing solutions if available.  
For now, you can : 
	- use the online tool [https://shacl.org/playground/](https://shacl.org/playground/). However, this tool is not checking some restrictions (e.g., datetime format). New work was moved to library [https://github.com/zazuko/rdf-validate-shacl](https://github.com/zazuko/rdf-validate-shacl)
	- use Apache Jena SHACL [https://jena.apache.org/documentation/shacl/](https://jena.apache.org/documentation/shacl/) - see examples below
	- use [Astrea Web Service](https://astrea.linkeddata.es/). This is a service under testing, but provides a good basis for reusing.

```
./shacl v -s demeterAgriProfile-SHACL.ttl -d instance-AIM_v2.ttl

@prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix sh:    <http://www.w3.org/ns/shacl#> .
@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .
@prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .

[ a            sh:ValidationReport ;
  sh:conforms  true
] .
```

```
./shacl v -s demeterAgriProfile-SHACL.ttl -d instance2-AIM_v2.ttl

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
./shacl v -s demeterAgriProfile-SHACL.ttl -d instance-bad-AIM_v2.ttl

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

The SHACL definition for whole AIM domain layer, which was generated using [Astrea Web Service](https://astrea.linkeddata.es/), is: 
[https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl](https://raw.githubusercontent.com/rapw3k/DEMETER/master/models/SHACL/demeterAgriProfile-SHACL.ttl)
