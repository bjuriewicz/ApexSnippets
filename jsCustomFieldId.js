{!REQUIRESCRIPT("/soap/ajax/34.0/connection.js")}

//do not use __c for custom fields and objects
var fieldIdResult = sforce.connection.query("SELECT durableId FROM fieldDefinition WHERE entityDefinition.developerName = 'My_CustomObj' AND developerName = 'My_Field'");
records = fieldIdResult.getArray("records"); 

var fieldId = records[0].DurableId.split('.')[1];

window.location.href = '/a1Z/e?CF' + fieldId + '={!myObject__c.Name}';