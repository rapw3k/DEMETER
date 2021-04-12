* MAKE SURe to SAVE version too first v2.0

java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o crossDomain-context.jsonld https://w3id.org/demeter/crossDomain
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriCommon-context.jsonld https://w3id.org/demeter/agri/agriCommon/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriFeature-context.jsonld https://w3id.org/demeter/agri/agriFeature/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriAlert-context.jsonld https://w3id.org/demeter/agri/agriAlert/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriCrop-context.jsonld https://w3id.org/demeter/agri/agriCrop/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriIntervention-context.jsonld https://w3id.org/demeter/agri/agriIntervention/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriPest-context.jsonld https://w3id.org/demeter/agri/agriPest/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriProduct-context.jsonld https://w3id.org/demeter/agri/agriProduct/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriProperty-context.jsonld https://w3id.org/demeter/agri/agriProperty/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o agriSystem-context.jsonld https://w3id.org/demeter/agri/agriSystem/2.0
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o farmAnimal-context.jsonld https://w3id.org/demeter/agri/farmAnimal/2.0

java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o livestockFeature-context.jsonld https://w3id.org/demeter/agri/ext/livestockFeature
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o poultryFeeding-context-xxx.jsonld https://w3id.org/demeter/agri/ext/poultryFeeding
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o fieldOperation-context.jsonld https://w3id.org/demeter/agri/ext/fieldOperation
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o stressRecognition-context.jsonld https://w3id.org/demeter/agri/ext/stressRecognition
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o transportCondition-context.jsonld https://w3id.org/demeter/agri/ext/transportCondition
java -jar /users/rap/GitRepositories/GitHub/owl2jsonld/target/uberjar/owl2jsonld-0.2.2-SNAPSHOT-standalone.jar -o nutrientMonitor-context.jsonld https://w3id.org/demeter/agri/ext/nutrientMonitor

---generating extensions
* save ttl, commit and push
* generate jsonld
* Remove the following terms, and double check by comparing with demeterAgriProfile-context.jsonld that shared terms are the same, 
    "name" : {
      "@id" : "http://xmlns.com/foaf/0.1/name"
    },
    
    ,
    "description" : {
      "@id" : "http://purl.org/dc/terms/description"
    }
* save jsonld, commit and push    