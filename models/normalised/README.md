
# Normalised version of AIM

This version of the AIM refactors the AIM information model to support a more modular and more semantically explicit set of relationships between models and underlying meta-models.

The general pattern is one of model isomorphism with alternative packaging with more explicit semantics.

{ a single graph containing all elements in a model, including those from external namespaces } <=> {only locally defined elements + imports of external model + profiling rules to specify local use of properties.}

These should result in isomorphic graphs after import closures are performed, and can potentially be transformed by treating files as graphs, and assuming presence of a definition in a graph indicates its availability for use in a profile.

Profiles may declare additional constraints - such as cardinality or domain and range  - for imported elements. The Normalised pattern allows identification of which of these constraints are canonical and which apply only to the current application of the model.

A Normalised model supports a 1:1 mapping with an import nesting of reusable JSON context documents, which in turn supports local caching of such resources.

Tooling to transform between normalised and single-graph views of profiles is under development.

profiles 



