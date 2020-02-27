# DEMETER AIM considerations

In line with best practices and recommendations, the specification of DEMETER AIM will follow a modular approach in a layered architecture, enabling among others:
1.  eased interoperability with existing models by reusing available (well-scoped) models in the modules, instead of defining new terms, whenever possible
1.  easy mapping/alignment with other models, by module instead of the whole model
1.  easy extension of the domain/areas covered in AIM with additional modules
1.  easy extension of domain model, by modifying only specific modules
1.  easy mapping to top-level/cross-domain ontologies 


# NGSI-LD considerations

The NGSI-LD Information Model is defined at three levels.
At the higher level, there are the foundation classes which correspond to the Core Meta-model and the Cross-Domain Ontology (see Figure below).  The former concerns the formal specification of the "property graph" model [i.6]. The latter includes is a set of generic, transversal classes which are aimed at avoiding conflicting or redundant definitions of the same classes in each of the domain-specific ontologies. Below these two levels, domain specific ontologies or vocabularies are devised.

![NGSI-LD core meta-model and partial cross-domain ontology](ngsi-ld-layers.png)

NGSI-LD uses JSON-LD as main serialisation format, which provides the key advantage that terms can be defined in a separate document, referenced by an @context statement. In particular, the The @context in JSON-LD is used to map terms provided as strings to concepts specified as URIs. 

NGSI adopts a graph-based meta-model solution along with blank node reification, which is “especially convenient when the graph is serialized with JSON-LD because blank nodes do not explicitly appear in the textual serialized description, and actually show up only when it is represented as an RDF graph. It is thus possible for a developer to generate the JSON-LD payload of an API in a form that is very similar to what he would have generated in plain JSON.”

## Separation of semantic referencing and structural descriptions

NGSI-LD information model separates semantic referencing, used in the classical sense of the Semantic Web, from
the actual structural description. 
* The structural description may itself be decomposed into a basis structural graph whose nodes are physically-matched entities, and an overlay layer used to capture the way in which these entities are clustered into subgraphs.
* Semantic referencing as defined by NGSI-LD is based on standard RDF/RDS/OWL typing and public ontologies, as shared
by all other semantic information models. All nodes and edges of the structural graph are thus matched to several relevant classes/categories of these ontologies that jointly characterize the features shared by all instances of these classes.

A structural graph is a model of the structural description of an environment, capturing the relationships between the different subsystems that make up this environment. This description is, to some extent, independent of the overlaying semantic referencing, and it could be considered to "stand on its own", even without this referencing. A structural graph does in fact have a different kind of semantics of its own, such as e.g. when a graph captures and matches the structure of a physical network like a power grid or a water distribution network. These semantics apply to the graphs as a whole and are not reducible to the kind of "per-resource" semantics, which RDF is meant to describe.


# NGSI-LD meta-model

According to the specification, the NGSI-LD meta-model provides a formal basis for representing "property graphs" using RDF/RDFS/OWL. It makes it possible to perform back and forth conversion between datasets based on the property graph model on the one hand and linked data datasets which rely on the RDF framework, on the other hand. This may be seen as raising the semantic expressivity of RDF triples to the level of property graphs. Property graphs may, contrary to RDF, use predicates as subjects of other predicates (properties of properties and properties of relationships).

According to the documentation, a graph-based model is the only model adapted to capture the complex structure and inter-entity relationships that make up context information as defined by NGSI. Also, that such information does not need to be semantically defined from the outset (it may be natively structural information, capturing e.g. containment or adjacency relationships); the semantics of this context may be added in a later stage of graph enrichment.

# Context documents and Schemas

## Roles
NGSI-LD uses both JSON Schema and JSON-LD Context documents for their respective roles: schema documents describe which elements must be present and Context documents provide information about what they mean (mainly by providing a Web URI to uniquely identify things.)

What information is provided at those Web addresses is a not defined, but for DEMETER to successfully integrate data it will be necessary to provide semantic descriptions of elements.

Content (property values) too needs to be explained and controlled - this leads to challenges factoring out standardised content from semantic data models.

Finally, NSGI-LD uses an object reference scheme based on its internal metamodel that needs tool support to turn object references into addresses for those objects in the NSGI environment, which is not natively able to support Linked Data style object references. This seems to be a idiosyncracity to support backwards compatibility between NGSI-LD and NGSI.

Tools exist, but are not completely documented, to derive NSGI-LD context documents from NSGI data schemas (NSGI data models are just schemas, rather than semantic models. )

## The NGSI-LD @context
The Core NGSI-LD (JSON-LD)[@context](https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld) is defined as a JSON-LD @context which contains:

* The core terms needed to represent the key concepts defined by the NGSI LD Information Model, including the meta-model and cross-ontology
* The terms needed to represent all the members that define the API-related Data Types

The challenges inherent in the NGSI-LD context include:

* URIs in the location document do not resolve to either human or machine-readable descriptions of what properties mean. (They should do both via content negotiation) 
* ad-hoc approach definitions, ignoring existing domain standrds - particularly spatio-temporal properties not aligned with domain standards (OGC and W3C, which maintain a formal liaison to develop best practices). for example:

```
unitCode: "https://uri.etsi.org/ngsi-ld/unitCode",
location: "https://uri.etsi.org/ngsi-ld/location",
observationSpace: "https://uri.etsi.org/ngsi-ld/observationSpace",
operationSpace: "https://uri.etsi.org/ngsi-ld/operationSpace",
GeoProperty: "https://uri.etsi.org/ngsi-ld/GeoProperty",
TemporalProperty: "https://uri.etsi.org/ngsi-ld/TemporalProperty",
timeInterval: "https://uri.etsi.org/ngsi-ld/timeInterval",
geoQ: "https://uri.etsi.org/ngsi-ld/geoQ",
temporalQ: "https://uri.etsi.org/ngsi-ld/temporalQ",
geometry: "https://uri.etsi.org/ngsi-ld/geometry",
coordinates: "https://uri.etsi.org/ngsi-ld/coordinates",
georel: "https://uri.etsi.org/ngsi-ld/georel",
geoproperty: "https://uri.etsi.org/ngsi-ld/geoproperty",
```

## FIWARE contexts

The FIWARE contexts are evolving from a very large flat list to a repository of data models. Some common models are factored out for reuse [[https://github.com/smart-data-models/data-models/blob/master/common-schema.json]].  This avoids some of the limitations of the NSGI models, but introduces a duplicate model covering the same ground - FIWARE is a discrete interoperability domain within an NGSI world, not interoperable with NGSI in general.

The FIWARe approach provides a translation between "normalised" models and simple schemas:

```
{
  "id": "urn:ngsi-ld:AgriApp:72d9fb43-53f8-4ec8-a33c-fa931360259a",
  "type": "AgriApp",
  "dateCreated": "2017-01-01T01:20:00Z",
  "dateModified": "2017-05-04T12:30:00Z",
  "name": "Wine track",
  ```
  
is normalised into the property-graph model

```
{
    "@context": [
        "https://schema.lab.fiware.org/ld/context",
        "https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"
    ],
    "id": "urn:ngsi-ld:AgriApp:72d9fb43-53f8-4ec8-a33c-fa931360259a",
    "type": "AgriApp",
    "createdAt": "2017-01-01T01:20:00Z",
    "modifiedAt": "2017-05-04T12:30:00Z",
    "name": {
        "type": "Property",
        "value": "Wine track"
    },
```

Schemas are defined for the simple model, it is still somewhat unclear whether the simple schema is operationally used.

Most importantly, FIWARE is referencing an external standard for many geo concepts (GeoJSON) rather than re-inventing the wheel, however its only doing this for data types in JSON schema, without declaring the equivalent semantics in a reusable context document. 


FIWARE tooling aggregates the complete set of data models into a single extensive context document. 

This represents a promising but not fully scalable start, and its roadmap indicates its still very immature and untested. 

## Profiles

FIWARE represents a _profile_ of NGSI-LD, and each FIWARE data model conforms to FIWARE rules - i.e. is a profile of the FIWARE profile of NGSI-LD.

This represents an interoperability contract that is not explicitly stated, but can be inferred from re-use of contexts and commonality across schemas.


DEMETER can define data models that either conform to an equivalent DEMETER profile of NGSI-LD, or relevant FIWARE models, depending on the suitability of those models. 

Whenever some common data structure is needed in different contexts this can be factored out into a separate profile and shared. Tooling to handle consolidating the inheritance chain of profiles can be simply implemented, and could be based on an augmentation of the FIWARE tools if required.

As a result an example might look like:

```
"@context": [
        "http://example.org/profiles/demeter/AnimalTracking",
        "https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"
    ],
    "id": "urn:ngsi-ld:demeter:IndoorAnimalTracking",

```  

```
"@context": [
        "https://schema.lab.fiware.org/ld/context/Animal",
        "https://schema.lab.fiware.org/ld/context/Location",
        "http://example.org/profiles/demeter/MovingObject",
        "https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"
    ],
    "id": "urn:ngsi-ld:demeter:AnimalTracking",

```

where the "AnimalTracking" profile inherits from reusable models for Animals, Location and MovingObjects.


# Insights

NGSI-LD approach is well founded, following a layered architecture and based on the increasingly popular JSON-LD serialisation format. Conceptually, it enables the good sides of two “worlds”: the benefits of linked data and underlying RDF-based reasoning tools and querying (enabling data integration, knowledge discovery, etc.) ,  and the richer expressivity of property graphs (using predicates as subjects of other predicates). 

The issues or challenges we highlight are more on the implementation of this approach:
 
* The current NGSI-LD context is just a simple flat schema that includes the meta-model and cross ontology terms without any explicit semantics. Except from some property JSON types (@type: DateTime, id), there are no definition that a term is a class, a property with explicit information about the type of property (e.g., relation, datatype), constraints on domains/ranges, cardinality, taxonomic relations, or other axioms. Of course the JSON @type would allow to infer that a given term is a relation (@type: @id), but even those with @type: DateTime are not defined explicitly with the type of property it is, as DateTime (https://uri.etsi.org/ngsi-ld/DateTime) is not having any explicit semantic information.
* The terms are not mapped to any standard and/or well-known ontologies/vocabularies (no reuse). There is some documentation dicussing some of such mappings; however, no implementation seems to be available to allow any integration. In fact, it is not clear, how such mappings would be implemented from the documentation reviewed. 
* Similarly, other modules/profiles (domain vocabularies) are defined in the same way (simple flat schemas with no mapping/reuse of existing standards and/or well-known ontologies). For instance, FIWARE Data Models [@context](https://fiware.github.io/data-models/context.jsonld) is used in many of the provided example and is part of the full [@context](https://fiware.github.io/data-models/full-context.jsonld) (along with the core @context) of NGSI-LD. This @context, in particular, defines many entities declaration related to many different domains related to FIWARE (described [here](https://github.com/GSMADeveloper/NGSI-LD-Entities) and with other examples [here](https://github.com/FIWARE/NGSI-LD_Experimental/blob/master/doc/example-code.md)) 
* The flat schema implementation approach is not scalable, and difficult to maintain.
* The only semantic information available is in fact included in the encoding of data itself, and is just minimal (e.g., an element is a property or a relationship). For instance, the encoding of a FIWARE agri parcel entity example is (partially) below (the full encoding of the example is available [here](ngsi-ld-fiware-parcel-example.jsonld) )

```
{
    "@context": [ 
        "https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld",
        "https://fiware.github.io/data-models/context.jsonld"
    ],
    "id": "urn:ngsi-ld:AgriParcelRecord:8f5445e6-f49b-496e-833b-e65fc97fcab7",
    "type": "AgriParcelRecord",
    "createdAt": "2017-01-01T01:20:00Z",
    "modifiedAt": "2017-05-04T12:30:00Z",
    "source": "https://source.example.com",
    "dataProvider": "https://provider.example.com",
    "entityVersion": 2.0,
    "hasAgriParcel": {
        "type": "Relationship",
        "object": "urn:ngsi-ld:AgriParcel:d3676010-d815-468c-9e01-25739c5a25ed"
    },
    "soilTemperature": {
        "type": "Property",
        "value": 27,
        "unitCode": "CEL",
        "observedAt": "2017-05-04T12:30:00Z"
    },
    "observedAt": {
        "type": "Property",
        "value": "2017-05-04T10:18:16Z"
    }
}

```
The transformation of that json-ld into RDF would be as follows:

```
@prefix ns0: <https://uri.etsi.org/ngsi-ld/> .
@prefix ns1: <https://uri.etsi.org/ngsi-ld/default-context/> .
@prefix ns2: <https://uri.fiware.org/ns/data-models#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<urn:ngsi-ld:AgriParcelRecord:8f5445e6-f49b-496e-833b-e65fc97fcab7>
  a <https://uri.fiware.org/ns/data-models#AgriParcelRecord> ;
  ns0:createdAt "2017-01-01T01:20:00Z"^^ns0:DateTime ;
  ns1:entityVersion 2 ;
  ns0:modifiedAt "2017-05-04T12:30:00Z"^^ns0:DateTime ;
  ns2:dataProvider "https://provider.example.com"^^xsd:string ;
  ns2:hasAgriParcel [
    a ns0:Relationship ;
    ns0:hasObject <urn:ngsi-ld:AgriParcel:d3676010-d815-468c-9e01-25739c5a25ed>
  ] ;
  ns2:observedAt [
    a ns0:Property ;
    ns2:value "2017-05-04T10:18:16Z"^^xsd:string
  ] ;
  ns2:soilTemperature [
    a ns0:Property ;
    ns0:unitCode "CEL"^^xsd:string ;
    ns2:observedAt "2017-05-04T12:30:00Z"^^ns0:DateTime ;
    ns2:value 27
  ] ;
  ns2:source "https://source.example.com"^^xsd:string .
```

As a result, many advantages of the linked data and underlying RDF-based reasoning tools and querying cannot be easily or directly  exploited, e.g., (automatic) data link discovery (integration), (automatic) model alignment for data integration, validation of conformance of data with the model with a simple reasoner, inferencing on the data to discover new knowledge, specialisations (taxonomy) with inheritance of axioms. 

Hence, taking into account the initial considerations of DEMETER AIM, our approach is in fact similar to the NGSI-LD approach, i.e., modular in a layered architecture. Based on that selected framework, our first design choice, though, was to decide whether to follow a 2-layer approach (top/cross domain + domain ontologies) with direct grounding on RDF/RDFS/OWL or a 3-layer approach as in NGSI-LD that includes the property graph meta-model layer (grounded on RDF/RDFS). After further analysis of the NGSI-LD specification, we decided on the latter for following reasons: 

1. It allows DEMETER AIM to be compliant and easily integrated with NGSI-LD data and models, thus facilitating the integration with exising datasets based on these models that may be relevant to DEMETER
1. It allows natively the representation of the rich and complex context information of different entities (e.g., systems/platforms/environments) typical within IoT (or WoT) applications, where the context includes the set of properties characterizing these entities, together with the set of relationships that enmesh them together, and the properties of these relationships and properties. This was the main motivation of NGSI-LD and it is also a very important aspect for DEMETER. 
1. It allows to have the best of two "worlds": property-graphs and linked data. It allows to perform back and forth conversion between datasets based on the property graph model on the one hand and linked data datasets which rely on the RDF framework, on the other hand. As described in [NGSI-spec], property graphs are the implicit semi-formal data models underlying most present-day graph databases, which have gained widespread use specially in the industry (as opposed to academia). They make it possible to attach properties (defined as key-value pairs) to relationships and other properties, a feature which RDF does not directly support, but they lack the standardization and formal underpinnings of RDF and do not interoperate directly with linked data and other RDF datasets. Also they do not lend themselves to reasoning with RDF-based reasoning tools or querying with standard query languages such as SPARQL.

Hence, DEMETER AIM follows the same 3-layer architecture of NGSI-LD, including a property graph meta-model layer (grounded in RDF/RDFS), a cross-domain (also called top level) ontologies layer, and the domain/application ontologies. However, as opposed to NGSI-LD, DEMETER AIM will implement the cross-domain and domain/application layers by reusing existing standards and/or well-known ontologies/vocabularies. 
 
As an example, consider the following agriculture management zone using FOODIE ontology as the underlying model encoded in RDF/turtle.

```
@prefix ns0: <http://foodie-cloud.com/model/foodie#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix ns1: <http://www.opengis.net/ont/geosparql#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

<http://w3id.org/foodie/core/ManagementZone/4>
  a <http://foodie-cloud.com/model/foodie#ManagementZone> ;
  ns0:code "CODA4"^^xsd:string ;
  ns0:creationDateTime "2015-12-01T00:00:00"^^xsd:dateTime ;
  ns0:cropSpecies <http://w3id.org/foodie/core/CropType/20> ;
  ns0:holdingZone <http://w3id.org/foodie/core/Plot/1> ;
  ns0:originType <http://w3id.org/foodie/core/OriginTypeValue/1> ;
  ns0:zoneAlert <http://w3id.org/foodie/core/Alert/4> ;
  ns1:hasGeometry <http://w3id.org/foodie/core/ManagementZone/4/geometry> ;
  rdfs:label "ManagementZone #4"^^xsd:string .
```
With DEMETER AIM, we would define an agriculture model module/profile as a JSON-LD @context, which defines the terms used in DEMETER by reusing existing standards and/or well-known ontologies/vocabularies, i.e., mapping DEMETER terms to the reused ontology/vocabulary terms. A short example of such @[context](DEMETER-agricontext.jsonld) (using FOODIE ontology for demonstration purposes) would be as follows:

```
{
    "@context": {
        "xsd" : "http://www.w3.org/2001/XMLSchema#",
        "Nutrients": "http://foodie-cloud.com/model/foodie#ProductNutrients",
        "Plot": "http://foodie-cloud.com/model/foodie#Plot",
        "DoseUnit": "http://foodie-cloud.com/model/foodie#DoseUnit",
        "TreatmentPlan": "http://foodie-cloud.com/model/foodie#TreatmentPlan",
        "ManagementZone": "http://foodie-cloud.com/model/foodie#ManagementZone",
        "Intervention" : "http://foodie-cloud.com/model/foodie#Intervention",
        "CropSpecies" : "http://foodie-cloud.com/model/foodie#CropSpecies",
        "Treatment" : "http://foodie-cloud.com/model/foodie#Treatment",
        "Holding" : "http://inspire.ec.europa.eu/schemas/af/3.0#Holding",
        "code" : "http://foodie-cloud.com/model/foodie#code",
        "creationDateTime" : {
        		"@id" : "http://foodie-cloud.com/model/foodie#creationDateTime",
        		"@type": "xsd:dateTime"
        },
        "cropSpecies" : {
        		"@id" : "http://foodie-cloud.com/model/foodie#cropSpecies",
        		"@type": "@id"
        },
        "originType" : {
        		"@id" : "http://foodie-cloud.com/model/foodie#originType",
        		"@type": "@id"
        },
        "zoneAlert" : {
        		"@id" : "http://foodie-cloud.com/model/foodie#zoneAlert",
        		"@type": "@id"
        },
        "holdingZone" : {
        		"@id" : "http://foodie-cloud.com/model/foodie#holdingZone",
        		"@type": "@id"
        }
    }
}
```
Then the encoding of the same management zone presented above in JSON-LD using DEMETER AIM would look like the listing below (see document [here](managementZone4-example.jsonld)), which could be easily transformed back to RDF (try [here](http://www.easyrdf.org/converter))  to get the same listing as above. Note that in addition to the agriculture context, we are adding two more terms to the context in this example (namely: label an geometry); however such terms would be defined in the future in different modules at the cross-domain level (e.g., geospatial model)

```
{
    "@context": [
         "https://rapw3k.github.io/DEMETER/DEMETER-agricontext.jsonld",
         {"label" : "http://www.w3.org/2000/01/rdf-schema#label",
           "geometry": {
                  "@id": "http://www.opengis.net/ont/geosparql#hasGeometry",
                  "@type":"@id"
             }
         }
    ],
    "@id": "http://w3id.org/foodie/core/ManagementZone/4",
    "@type": "ManagementZone",
    "label": "ManagementZone #4",
    "code" : "CODA4",
    "creationDateTime" : "2015-12-01T00:00:00",
    "cropSpecies" : "http://w3id.org/foodie/core/CropType/20",
    "holdingZone" : "http://w3id.org/foodie/core/Plot/1",
    "originType" : "http://w3id.org/foodie/core/OriginTypeValue/1",
    "zoneAlert" : "http://w3id.org/foodie/core/Alert/4",
    "geometry" : "http://w3id.org/foodie/core/ManagementZone/4/geometry"
}
```
However, if we would like to use the expressivity of the property graph model (to raise the semantic expressivity of RDF triples to the level of property graphs), we would first define our core meta-model @[context](DEMETER-core-metamodel.jsonld) as defined below:

```
{
   "@context": {
      "id": "@id",
      "type": "@type",
      "value": "https://uri.etsi.org/ngsi-ld/hasValue",
      "object": {
          "@id": "https://uri.etsi.org/ngsi-ld/hasObject",
          "@type":"@id"
      },
      "Property": "https://uri.etsi.org/ngsi-ld/Property",
      "Relationship": "https://uri.etsi.org/ngsi-ld/Relationship"
   }
}
```
Then we would be able to attach properties to relantionships or other properties (i.e., using the property graph model). So, in our previous example, if we would like to attach properties to one of our data type properties values (e.g., code to say for instance the codelist name or organisation name),  and to one of object property values (e.g., cropSpecies to say for instance at what time was this information was captured), the encoding of the previous management zone would be as the listing below (see document [here](managementZone4-example-property-graph.jsonld)). Note that no extra properties are attached in the example though, as this is just for illustration):

```
{
    "@context": [
         "https://rapw3k.github.io/DEMETER/DEMETER-agricontext.jsonld",
         "https://rapw3k.github.io/DEMETER/DEMETER-core-metamodel.jsonld",
         {
             "label" : "http://www.w3.org/2000/01/rdf-schema#label",
             "geometry": {
                  "@id": "http://www.opengis.net/ont/geosparql#hasGeometry",
                  "@type":"@id"
             }
         }
    ],
    "id": "http://w3id.org/foodie/core/ManagementZone/4",
    "type": "ManagementZone",
    "label": "ManagementZone #4",
    "code": {
       "type": "Property",
       "value": "CODA4"
     },
    "creationDateTime" : "2015-12-01T00:00:00",
    "cropSpecies" : {
        "type": "Relationship",
        "object": "http://w3id.org/foodie/core/CropType/20"
    },
    "holdingZone" : "http://w3id.org/foodie/core/Plot/1",
    "originType" : "http://w3id.org/foodie/core/OriginTypeValue/1",
    "zoneAlert" : "http://w3id.org/foodie/core/Alert/4",
    "geometry" : "http://w3id.org/foodie/core/ManagementZone/4/geometry"
}
```
Now, if we see the corresponding RDF/Turtle representation, it would be like the listing below:

```
@prefix ns0: <http://foodie-cloud.com/model/foodie#> .
@prefix ns1: <https://uri.etsi.org/ngsi-ld/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix ns2: <http://www.opengis.net/ont/geosparql#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

<http://w3id.org/foodie/core/ManagementZone/4>
  a <http://foodie-cloud.com/model/foodie#ManagementZone> ;
  ns0:code [
    a <https://uri.etsi.org/ngsi-ld/Property> ;
    ns1:hasValue "CODA4"^^xsd:string
  ] ;
  ns0:creationDateTime "2015-12-01T00:00:00"^^xsd:dateTime ;
  ns0:cropSpecies [
    a ns1:Relationship ;
    ns1:hasObject <http://w3id.org/foodie/core/CropType/20>
  ] ;
  ns0:holdingZone <http://w3id.org/foodie/core/Plot/1> ;
  ns0:originType <http://w3id.org/foodie/core/OriginTypeValue/1> ;
  ns0:zoneAlert <http://w3id.org/foodie/core/Alert/4> ;
  ns2:hasGeometry <http://w3id.org/foodie/core/ManagementZone/4/geometry> ;
  rdfs:label "ManagementZone #4"^^xsd:string .
```
