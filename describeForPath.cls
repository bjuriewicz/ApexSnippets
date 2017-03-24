public static Schema.DescribeFieldResult getFieldDescribeForPath(String sobjectAPIName, String fieldPath) {
        if (GLOBAL_DESCRIBE.containsKey(sobjectAPIName)) {
            return null;
        }
        Schema.SObjectType SObjectTypeObj = GLOBAL_DESCRIBE.get(sobjectAPIName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
        Map <String, Schema.SObjectField> fieldsMap = DescribeSObjectResultObj.fields.getMap();
        Schema.DescribeFieldResult fieldDescribe = null;
        Schema.sObjectType lastSObjectType = null;
        if (fieldPath.contains('.')) {
            lastSObjectType = SObjectTypeObj;
            Iterator<String> i = fieldPath.split('\\.').iterator();
            while (i.hasNext()) {
                String field = i.next();
                Schema.SObjectField token = lastSObjectType.getDescribe().fields.getMap().get(field.toLowerCase());
                if (token == null) {
                    token = lastSObjectType.getDescribe().fields.getMap().get(field.toLowerCase() + 'Id');
                }

                if (token == null && field.endsWithIgnoreCase('__r')) {
                    token = lastSObjectType.getDescribe().fields.getMap().get(field.toLowerCase().substring(0, field.length() - 1) + 'c');
                }

                if (token != null && i.hasNext() && token.getDescribe().getSOAPType() == Schema.SOAPType.ID) {
                    lastSObjectType = token.getDescribe().getReferenceTo()[0]; 
                } else if (token != null && !i.hasNext()) {
                    fieldDescribe = token.getDescribe();
                }
            }
        } else if (fieldsMap.containsKey(fieldPath)) {
            fieldDescribe = fieldsMap.get(fieldPath).getDescribe();
        }
        if (fieldDescribe == null) {
            // throw exception
        }
        return fieldDescribe;
    }