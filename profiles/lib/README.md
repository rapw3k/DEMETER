# Ontology cache
This is a library for local versions of ontologies. Ontologies are mapped to canonical (owl:import URI values) using the profiles manifest (profile_cat.ttl). 

It will be persisted in git repositories. 

If ontologies are either not accessible by the canonical URI or can be preloaded safely then they should be persisted in this directory and referenced in the profiles manifest at profile_cat.ttl