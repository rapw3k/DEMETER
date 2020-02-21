# Interoperability at Scale

## Interoperability value

Interoperability can be looked at through a very narrow lens of a transaction between a producer and a consumer of data, with intermediate processing steps acting as both consumers and producers.

Interoperability reduces the overall cost of _using_ software. The end user needs to assimilate less information about a data source to consume it, as some aspects of it are "well known" and can be dealt with by reusable software. 

This is typically extended the "publish-find-bind" model which introduces a third __catalog_ component whose function is to assist clients identify services they can interoperate with.

So a community of practice can publish some information which increases interoperability, to realise some benefit ""at scale".

The problem is what information is needs and in what form?

## Trade-offs 

What a user needs to know about a data source is quite complex. This may be described in a "data product specification" of some sort, such documents are very involved. If this is observational data it will include a lot of specific information about the science, process, interpretation etc.  Such information can be arbitrarily detailed, and only standardised in a few cases where the interoperability imperative means sufficient resources can be applied.

So typically, interoperability is a partial solution, and typically is based on allowing software components to be designed to deal with data access and transfer, and the end-user to work out how to assimilate that data. The level of detail determines how much effort is left to the user relatively to the software developer.

The size, informational complexity and sophistication of the community of practice determines where the cost-benefit ratio balances between investment in standards and software, and complexity for the end user. 

If the community is one with a single data provider and many users, then a single custom API is sufficient - developers just need some interoperability in the API definition, and can do all the data interpretation needed to present simple information to a user.

In more complex domains however, there will be many data providers, and many clients, including data archiving, data processing and decision support systems. A simple API cannot be described in sufficient detail to handle all cases without become overwhelmingly complex.

At this point it is necessary to break down the different aspects of interoperability, and who the stakeholders are:

## Dimensions of Interoperability 

This is a crude breakdown of typical things that are often standardised to improve interoperability 

<table><tr><th>Aspect</th><th>Stakeholders</th><th>Function</th><th>Example</th></tr>
<tr>
<td><b>API</b></td><td>client software developers</td><td>Allow clients to access specific data or functions<td><td>OGC API, NGSI</td>
</tr>
<tr>
<tr>
<td><b>API model</b></td><td>Developers of APIs and tools to create clients</td><td>Standardise way APIs are described.<td><td>OpenAPI</td>
</tr>
<tr>
<td><b>Format</b></td><td>Schema definers</td><td>Define structure according to a meta-model.<td><td>XML, CSV, JSON, RDF encodings</td>
</tr>
<td><b>Schema</b></td><td>Meta-model aware clients</td><td>Map elements of a data model to an encoding meta-model. Often confused or conflated with data model.<td><td>FOAF, NGSI-data models</td>
</tr>
<tr>
<td><b>Data model</b></td><td>Data publishers and consumers</td><td>Define objects, thier properties and relationships.<td><td>DCAT, OWL, SKOS, PROF</td>
</tr>
<tr>
<td><b>Vocabularies</b></td><td>Data modellers, schema developers</td><td>Define reusable elements for data model interperability. <td><td>Dublin core, Schema.org</td>
</tr>
<tr>
<td><b>Taxonomies</b></td><td>Data specifiers, data processors</td><td>Provide definitions and relationships between coded content values.<td><td>OpenAPI,OGC API, NGSI</td>
</tr>
<tr><td><b>Profiles</b></td><td>Data specifiers, data processors</td><td>Define how more general specifications can be used in specific contexts.<td><td>GeoDCAT</td>
</tr>
<tr><td><b>Data products</b></td><td>Data specifiers, data processors</td><td>Define arbitrary details of data, including quality, structure, content rules etc.<td><td>statistical reporting, census, national mapping products</td>
</tr>
<tr><td><b>Data access</b></td><td>Data producers and consumers</td><td>Specify data access terms and mechanisms, such as licences and service availability.<td><td>CC-By and other licences.</td>
</tr>
</table>

This is not exhaustive, nor are the stakeholders necessarily different individuals, however it is aimed at identifying that interoperability is a multi-faceted problem, and that for any given circumstance different stakeholders will have different motivations, capabilities and cost-benefit equations for standardising different aspects of interoperability.

## Scaling

With a more detailed breakdown it is possible to think about total costs and benefits at different scales, over different time periods.  

We have an "interoperability backlog" - defined as the gap between the optimum level of interoperability for a domain in the long term and the current level of interoperability achieved - and evidenced by the many activities looking to improve interoperability. 

This shortfall exists because short-term project design choices start to make sense because they do not factor in costs or benefits beyond project participants or project timescales. This applies to software development too - products have markets and post-sale concerns are weighted lower than immediate value at sale time.

This is the "local optimum" problem - the best solution at one scale does not necessarily work best at other scales.

If a particular transaction can be improved by use of a common schema, then the benefit that accrues is based on how many transactions are involved, how many users, how often an user performs that transaction, what is the initial cost of evaluating the use of data in a given way, and how much each subsequent usage costs.

For example, if data contains a set of values, and those values are standardised, a user may only need to establish the meaning of these once, decide how to treat each value, and then repeat this at low marginal cost for repeated transactions. If the these values are not standardised, then a great deal of effort may be required per transaction to interpret them.

Costs to develop and promulgate a standard are amortised over the total value achieved by making transactions more efficient. If transactions are few, or the benefit marginal, interoperability is less important than if many users, many data sources or many transactions are involved. 

The more flexible a system needs to be, the more things like mechanisms for incrementally improving interoperability, such as publishing data schemas, matter rather than specific instances of these artefacts.




## Implications

A "one-size-fits all" reference architecture for interoperability will not easily yield insight into where the interoperability gaps, drivers and opportunities arise. Conversely, using this more detailed breakdown of concerns it is possible to look at any situation and identify where specific problems and opportunities lie, and what technical approach and skills may be most relevant.