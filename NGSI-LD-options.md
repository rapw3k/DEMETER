# Assessment of potential and challenges using NSGI-LD as a basis for DEMETER


## Meta-models

NSGI-LD is based on:
1.  the JSON object model (basically a tree )
1. the use of multiple community managed schemas
1. with the ability to annotate the elements in the schema with a context document.

https://github.com/smart-data-models/data-models

https://github.com/smart-data-models/data-models#general-principles

## Pros
1. A set of schemas for some specific applications exist
1. Some sort of governance framework for these is emerging
1. A standards methodology for publishing new schemas within repository structures is defined
1. Tools to validate specifications provided
1. tools to create JSON-LD contexts from schemas show these need to be kept in sync and reinforces that these provide complementary but distinct functions.

## Cons
1. The 'long list' model of schemas does not seem to be very maintainable over time
1. DEMETER will need to manage data models withing processing and decision tree chains - these wont fit very well with NSGI models - going to map more closely to OGC models of coverages, timeseries, featuire collections etc.
1. The NSGI context document is a monolithic list of terms from the set of schemas (?) at some point in time - 1800 - this is neither scalable nor maintainable.
1. the contect-from schema generation approach  only supports a single namespace - it does not appear to support reuse of elements across muliple schemas
1. There does not appear to be any governance mechanism (beyond listing in the context document) to ensure re-use of elements, or common semantics for reused names across schemas.
1. There is no model for how data lements delivered by different schema might relate to each other.
1. There is no provision for factoring out common structures from different data models, and reusing them. (poor modularity)
1. There is a "weak" model for spatial properties - ETSI did touch base with OGC last year and recognised they need to think about how to do this properly. (There is no requirement to use the ETSI model, )
1. A mechanism to bind standardised content rules (controlled vocabularies) to NSGI-LD schemas would be required to achieve data interoperability in practice.

## Possible non-issues
1. The property graph model is not actually that different from RDF - they just have slightly different ways of annotating properties, they are probably isomorphic and more or less compact depending on how much related detail is included.

## observations
1. the context-generation utilities are poorly documented and didnt run - but inspection of the code makes it clear what intended to do - wouldnt be hard to develop a more sophiticated version

## Unknowns
1. how much legacy code is involved - how wedded to existing NSGI-LD schemas is the project?
2. how well will existing code cope with richer data models (property labelling) inside simple schema?
3. how much is the community reliant on being limited to understanding really flat schemas?

## suggested approach (to mitigating cons..)

1. A number of data structures will need to be standardised
2. OGC compatible data types for spatial stuff should be supported
3. ETSI trivial spatial data objects should be mapped as special cases of more general OGC things. (i.e. making it possible to entail explicit geometries from ETSI shortcuts, and vice versa)
4. reuse of structures and content should be modularised as formalised profiles, and project schemas should derive from the common modular building block profiles to minimise effort and maximise interoperability.
5. tools should be evolved to cope with a more sophisticated and scalable approach to schema definition.
6. a parallel schema repository based on the NSGI-LD data models repository should be developed for the project, so additional capabilities can be governed developed, tested, supported by tools etc.
7. OGC should liase with TM-Group and ETSI top explore and formalise interoperability mechanisms across domains.
8. Profiling mechanisms to support specification of content within schemas is proposed and tested. (Suggest RDF-Datacube with some extension to support mapping of a common data model to multiple alternative schemas)
9. 


