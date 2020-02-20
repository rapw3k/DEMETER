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

The meta-model solution in NGSI-LD is based on blank node reification, which is “especially convenient when the graph is serialized with JSON-LD because blank nodes do not explicitly appear in the textual serialized description, and actually show up only when it is represented as an RDF graph. It is thus possible for a developer to generate the JSON-LD payload of an API in a form that is very similar to what he would have generated in plain JSON.”

# NGSI-LD meta-model

According to the specification, the NGSI-LD meta-model provides a formal basis for representing "property graphs" using RDF/RDFS/OWL. It makes it possible to perform back and forth conversion between datasets based on the property graph model on the one hand and linked data datasets which rely on the RDF framework, on the other hand. This may be seen as raising the semantic expressivity of RDF triples to the level of property graphs. Property graphs may, contrary to RDF, use predicates as subjects of other predicates (properties of properties and properties of relationships).

# The NGSI-LD @context
The Core NGSI-LD (JSON-LD)[@context](https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld) is defined as a JSON-LD @context which contains:

* The core terms needed to represent the key concepts defined by the NGSI LD Information Model, including the meta-model and cross-ontology
* The terms needed to represent all the members that define the API-related Data Types

# OWL considerations

The OWL 2 Web Ontology Language (OWL 2) is an ontology language for the Semantic Web with formally defined meaning. OWL 2 ontologies provide classes, properties, individuals, and data values and are stored as Semantic Web documents. OWL 2 ontologies can be used along with information written in RDF, and OWL 2 ontologies themselves are primarily exchanged as RDF documents.

In an OWL 2 DL ontology, as in OWL 1, the sets of object properties, datatype properties, annotation properties and ontology properties must be mutually disjoint. In other words, no IRI I is declared in Ax (set of axioms in ontology) as being of more than one type of property; that is, no I is declared in Ax to be both object and data, object and annotation, or data and annotation property. Hence, dc:creator cannot be at the same time a datatype property and an annotation property.

In OWL2 DL a resource cannot be a class, property, or instance at the same time - they may share the same name (this is called “punning”) but will always be treated as distinct things by the underlying logic. With punning, an IRI may denote different entity-types (e.g. both an individual and a class) at the same time. For instance, in OWL 2 it is possible to use the same IRI as a name for both a class and an individual, but with the understanding that the class and the individual are two different views on the same IRI, i.e. they are interpreted semantically as if they were distinct.

Ontologies that are not in OWL 2 DL are often said to belong to OWL 2 Full, and can only be interpreted under RDF-Based Semantics.  OWL 2 Full is used to refer to RDF graphs considered as OWL 2 ontologies and interpreted using the RDF-Based Semantics. OWL 2 DL is a syntactically restricted version of OWL 2 Full where the restrictions are designed to make life easier for implementors (OWL 2 Full is undecidable while with OWL 2 DL reasoners can be written in principle to return yes/no answers), and the most straightforward extension of RDFS. The two main differences are that under the Direct Semantics annotations have no formal meaning and under the RDF-Based Semantics there are some extra inferences that arise from the RDF view of the universe. Some characteristics under the OWL 2 RDF-Based Semantics (OWL 2 full) include

* For annotations properties, annotations are not "semantic-free". As  every other triple or set of triples occurring in an RDF graph, an annotation is assigned a truth value by any given OWL 2 RDF-Based interpretation. 
* Individuals may play different "roles". For example, an individual can be both a data property and an annotation property, since the different parts of the universe of an OWL 2 RDF-Based interpretation are not required to be mutually disjoint, or an individual can be both a class and a property by associating both a class extension and a property extension with it.
* There is usually no need to provide localizing information (e.g., by means of "typing triples") for the IRIs occurring in an ontology. As for the RDF Semantics, the OWL 2 RDF-Based semantic conditions have been designed to ensure that the denotation of any IRI will be in the appropriate part of the universe. For example, the RDF triple "C owl:disjointWith D" is sufficient to deduce that the denotations of the IRIs C and D are actually classes. It is not necessary to explicitly add additional typing triples "C rdf:type rdfs:Class" and "D rdf:type rdfs:Class" to the ontology.
* Every class represents a specific set of individuals, called the class extension of the class: an individual a is an instance of a class C, if a is a member of the class extension ICEXT(C). Since a class is itself an individual under the OWL 2 RDF-Based Semantics, classes are distinguished from their respective class extensions. This distinction allows, for example, that a class may be an instance of itself by being a member of its own class extension. Also, two classes may be equivalent by sharing the same class extension, although being different individuals, e.g., they do not need to share the same properties. Similarly, every property has an associated property extension that consists of pairs of individuals: an individual a1 has a relationship to an individual a2 with respect to a property p if the pair ( a1 , a2 ) is a member of the property extension IEXT(p). Again, properties are distinguished from their property extensions

# Insights

NGSI-LD approach is well founded, following a layered architecture and based on the increasingly popular JSON-LD serialisation format. Conceptually, it enables the good sides of two “worlds”: the benefits of linked data and underlying RDF-based reasoning tools and querying (enabling data integration, knowledge discovery, etc.) ,  and the richer expressivity of property graphs (using predicates as subjects of other predicates). 

The issues or challenges we highlight are more on the implementation of this approach. 
* The current NGSI-LD context is just a simple flat schema that includes the meta-model and cross ontology terms without any explicit semantics. Except from some property JSON types (@type: DateTime, id), there are no definition that a term is a class, a property with explicit information about the type of property (e.g., relation, datatype), constraints on domains/ranges, cardinality, taxonomic relations, or other axioms. Of course the JSON @type would allow to infer that a given term is a relation (@type: @id), but even those with @type: DateTime are not defined explicitly with the type of property it is, as DateTime (https://uri.etsi.org/ngsi-ld/DateTime) is not having any explicit semantic information.
* The terms are not mapped to any standard and/or well-known ontologies/vocabularies (no reuse). There is some documentation dicussing some of such mappings; however, no implementation seems to be available to allow any integration. In fact, it is not clear, how such mappings would be implemented from the documentation reviewed. 
* Similarly, other modules/profiles (domain vocabularies) are defined in the same way (simple flat schemas with no mapping/reuse of existing standards and/or well-known ontologies). For instance, FIWARE Data Models [@context](https://fiware.github.io/data-models/context.jsonld) is used in many of the provided example and is part of the full [@context](https://fiware.github.io/data-models/full-context.jsonld) (along with the core @context) of NGSI-LD. 
* The flat schema implementation approach is not scalable, and difficult to maintain.
* The only semantic information available is in fact included in the encoding of data itself, and is just minimal (e.g., an element is a property or a relationship). For instance, the encoding of a FIWARE agri parcel entity example is (partially) below (the full encoding of the example is available [here](ngsi-ld-fiware-parece-example.jsonld) )
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

Hence, taking into account the initial considerations of DEMETER AIM, our approach is in fact similar to the NGSI-LD approach, i.e., modular in a layered architecture. Based on that selected framework, our first design choice, though, was to decide whether to follow a 2-layer approach (top/cross domain + domain ontologies) with direct grounding on RDF/RDFS/OWL or a 3-layer approach as in NGSI-LD that includes the property graph meta-model layer (grounded on RDF/RDFS). After further analysis of the NGSI-LD specification, we decided on the latter for two reasons: 
i) It allows DEMETER AIM to be compliant and easily integrated with NGSI-LD data and models. 
ii) It allows natively the representation of the rich and complex context information of different entities (e.g., systems/platforms/environments) typical within IoT (or WoT) applications, where the context includes the set of properties characterizing these entities, together with the set of relationships that enmesh them together, and the properties of these relationships and properties. This was the main motivation of NGSI-LD and it is also a very important aspect for DEMETER. 
iii) It allows to have the best of two "worlds": property-graphs and linked data. It allows to perform back and forth conversion between datasets based on the property graph model on the one hand and linked data datasets which rely on the RDF framework, on the other hand. As described in [NGSI-spec], property graphs are the implicit semi-formal data models underlying most present-day graph databases, which have gained widespread use specially in the industry (as opposed to academia). They make it possible to attach properties (defined as key-value pairs) to relationships and other properties, a feature which RDF does not directly support, but they lack the standardization and formal underpinnings of RDF and do not interoperate directly with linked data and other RDF datasets. Also they do not lend themselves to reasoning with RDF-based reasoning tools or querying with standard query languages such as SPARQL.

Hence, DEMETER AIM follows the same 3-layer architecture of NGSI-LD, including a property graph meta-model layer (grounded in RDF/RDFS), a cross-domain (also called top level) ontologies layer, and the domain/application ontologies. However, as opposed to NGSI-LD, DEMETER AIM will implement the cross-domain and domain/application layers by reusing existing standards and/or well-known ontologies/vocabularies. 
 


