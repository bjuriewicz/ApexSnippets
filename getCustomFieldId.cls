public static String getSobjectFieldId(String sobjectName, String fieldName){
    sobjectName = sobjectName.removeEnd('__c');
    fieldName = fieldName.removeEnd('__c');
    fieldDefinition[] res = [SELECT durableId FROM fieldDefinition WHERE entityDefinition.developerName = :fieldName AND developerName = :sobjectName]; 
    return res[0].durableId.substringAfter('.');
}