from rdflib import Graph,namespace
from rdflib.term import URIRef, Literal
from rdflib.namespace import Namespace,NamespaceManager,RDF, RDFS

file="test"
g = Graph()
g.parse(".".join((file,"jsonld")), format="json-ld")
len(g)

for  fmt  in ['ttl',] :
    g.serialize(destination=".".join((file,fmt)) , format=fmt, indent=4)
