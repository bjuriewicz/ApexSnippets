@isTest
private class IAR_AB_test_DynamicINQueryBuilder {
	
	
    @isTest static void shouldBuildDynamicInQuery() {
        Map<String, Set<Object>> testData = new Map<String, Set<Object>>{
            'Name' => new Set<Object> {'test1', 'test2'},
            'createdDate' => new Set<Object> {Datetime.now()},
            'NumberOfEmployees' => new Set<Object> { 10, 20 },
            'isCustomerPortal' => new Set<Object> {true, false}
            };

        IAR_AB_DynamicINQueryBuilder builder = new IAR_AB_DynamicINQueryBuilder(new List<String>(testData.keySet()), 'Account', testData);
        for(String fieldName: testData.keySet()) {
            System.assert(builder.soql.containsIgnoreCase(fieldName));
        }
        builder.query();
	}
}
