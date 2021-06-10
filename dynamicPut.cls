public class DynamicPut {

    /*
    * set sobject field value from nested path like Contact's 'Account.Name'
    * _baseSObject_ is for recursion only, pass null
    * Usage example: 
    Opportunity o = new Opportunity();
    SObject res = dynamicPut(o, 'Pricebook2.custom__c', 'hello world', null);
    */
    SObject dynamicPut(SObject o, String path, object value, sobject baseSObject) {
        if (baseSObject == null) {
            baseSObject = o;
        }
        if (path.containsNone('.'))  {
            o.put(path, value);
            return baseSObject;
        }
        
        Schema.SObjectType t = o.getSObjectType();
        Schema.DescribeSObjectResult tDescribe = t.getDescribe(SObjectDescribeOptions.FULL);
        String relationshipName = path.substringBefore('.');
        SObject childSObject;
        Schema.SObjectType childT;
        Map<String, Schema.SObjectField> fieldsMap = tDescribe.fields.getMap();
        for(String f : fieldsMap.keySet()) {
            Schema.DescribeFieldResult fData = fieldsMap.get(f).getDescribe();
            
            if (relationshipName == fData.getRelationshipName()) {
                childT = fData.getReferenceTo()[0];
                childSObject = (o.getSObject(relationshipName) == null) ? childT.newSObject() : o.getSObject(relationshipName);
                o.putSObject(relationshipName, childSObject);
                break;
            }
        }
        if (childT == null) return baseSObject;
        
        return dynamicPut(childSObject, path.substringAfter('.'), value, baseSObject);
    }

}