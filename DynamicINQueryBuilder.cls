public with sharing class IAR_AB_DynamicINQueryBuilder {
    private Set<String> aString = new Set<String>();
    private Set<String> bString = new Set<String>();
    private Set<String> cString = new Set<String>();
    private Set<String> dString = new Set<String>();
    private Set<String> eString = new Set<String>();

    private Set<Decimal> aDecimal = new Set<Decimal>();
    private Set<Decimal> bDecimal = new Set<Decimal>();
    private Set<Decimal> cDecimal = new Set<Decimal>();
    private Set<Decimal> dDecimal = new Set<Decimal>();
    private Set<Decimal> eDecimal = new Set<Decimal>();

    private Set<Date> aDate = new Set<Date>();
    private Set<Date> bDate = new Set<Date>();
    private Set<Date> cDate = new Set<Date>();
    private Set<Date> dDate = new Set<Date>();
    private Set<Date> eDate = new Set<Date>();

    private Set<DateTime> aDateTime = new Set<DateTime>();
    private Set<DateTime> bDateTime = new Set<DateTime>();
    private Set<DateTime> cDateTime = new Set<DateTime>();
    private Set<DateTime> dDateTime = new Set<DateTime>();
    private Set<DateTime> eDateTime = new Set<DateTime>();

    private Set<Boolean> aBoolean = new Set<Boolean>();
    private Set<Boolean> bBoolean = new Set<Boolean>();
    private Set<Boolean> cBoolean = new Set<Boolean>();
    private Set<Boolean> dBoolean = new Set<Boolean>();
    private Set<Boolean> eBoolean = new Set<Boolean>();

    private Set<Integer> aInteger = new Set<Integer>();
    private Set<Integer> bInteger = new Set<Integer>();
    private Set<Integer> cInteger = new Set<Integer>();
    private Set<Integer> dInteger = new Set<Integer>();
    private Set<Integer> eInteger = new Set<Integer>();

    public String soql {get; private set; }
    private String[] fields;
    private List<String> whereStrings;

    public IAR_AB_DynamicINQueryBuilder(String[] fields, String sobType, Map<String, Set<Object>> whereSets) {
        this.fields = fields;
        soql = 'select Id, ' + String.join(fields, ', ') + ' from ' + sobType + ' where ';

        whereStrings = new List<String>();
        Integer size = whereSets.size();
        List<String> whereFields = new List<String>();
        whereFields.addAll(whereSets.keySet());

        for (String s : whereSets.keySet()) {
            //create list from set of field values to get 1st object
            List<Object> whereListFieldValues = new List<Object>();
            whereListFieldValues.addAll(whereSets.get(s));
            //get type of first object to add to its type set
            Object o = whereListFieldValues[0];
            if (o != null) {
                if (o instanceof String) {
                    addStringSet(s, whereSets.get(s));
                }
                else if (o instanceof Integer) {
                    addIntegerSet(s, whereSets.get(s));
                }
                else if (o instanceof Decimal) {
                    addDecimalSet(s, whereSets.get(s));
                }
                else if (o instanceof Date) {
                    addDateSet(s, whereSets.get(s));
                }
                else if (o instanceof DateTime) {
                    addDateTimeSet(s, whereSets.get(s));
                }
                else if (o instanceof Boolean) {
                    addBooleanSet(s, whereSets.get(s));
                }
            }
        }
        soql += String.join(whereStrings, ' and ');
    }

    public SObject[] query() {
        return Database.query(soql);
    }

    private void addStringSet(String field, Set<Object> objectSet) {
        Set<String> stringSet = new Set<String>();
        for (Object o : objectSet) {
            stringSet.add((String)o);
        }

        if (aString.isEmpty()) {
            aString.addAll(stringSet);
            whereStrings.add(field + ' in :aString');
        }
        else if (bString.isEmpty()) {
            bString.addAll(stringSet);
            whereStrings.add(field + ' in :bString');
        }
        else if (cString.isEmpty()) {
            cString.addAll(stringSet);
            whereStrings.add(field + ' in :cString');
        }
        else if (dString.isEmpty()) {
            dString.addAll(stringSet);
            whereStrings.add(field + ' in :dString');
        }
        else if (eString.isEmpty()) {
            eString.addAll(stringSet);
            whereStrings.add(field + ' in :eString');
        }
        else {
           throw new DuplicateException(
               'Cannot match more than 5 fields of any one type - in this case String. '
               + 'The 6th String field is ' + field + '.'
           );
        }
    }

    private void addDecimalSet(String field, Set<Object> objectSet) {
        Set<Decimal> decimalSet = new Set<Decimal>();
        for (Object o : objectSet) {
            decimalSet.add((Decimal)o);
        }

        if (aDecimal.isEmpty()) {
            aDecimal.addAll(decimalSet);
            whereStrings.add(field + ' in :aDecimal');
        }
        else if (bDecimal.isEmpty()) {
            bDecimal.addAll(decimalSet);
            whereStrings.add(field + ' in :bDecimal');
        }
        else if (cDecimal.isEmpty()) {
            cDecimal.addAll(decimalSet);
            whereStrings.add(field + ' in :cDecimal');
        }
        else if (dDecimal.isEmpty()) {
            dDecimal.addAll(decimalSet);
            whereStrings.add(field + ' in :dDecimal');
        }
        else if (eDecimal.isEmpty()) {
            eDecimal.addAll(decimalSet);
            whereStrings.add(field + ' in :eDecimal');
        }
        else {
           throw new DuplicateException(
               'Cannot match more than 5 fields of any one type - in this case Decimal. '
               + 'The 6th Decimal field is ' + field + '.'
           );
        }
    }
    private void addIntegerSet(String field, Set<Object> objectSet) {
        Set<Integer> integerSet = new Set<Integer>();
        for (Object o : objectSet) {
            IntegerSet.add((Integer)o);
        }

        if (aInteger.isEmpty()) {
            aInteger.addAll(integerSet);
            whereStrings.add(field + ' in :aInteger');
        }
        else if (bInteger.isEmpty()) {
            bInteger.addAll(integerSet);
            whereStrings.add(field + ' in :bInteger');
        }
        else if (cInteger.isEmpty()) {
            cInteger.addAll(integerSet);
            whereStrings.add(field + ' in :cInteger');
        }
        else if (dInteger.isEmpty()) {
            dInteger.addAll(integerSet);
            whereStrings.add(field + ' in :dInteger');
        }
        else if (eInteger.isEmpty()) {
            eInteger.addAll(integerSet);
            whereStrings.add(field + ' in :eInteger');
        }
        else {
           throw new DuplicateException(
               'Cannot match more than 5 fields of any one type - in this case Integer. '
               + 'The 6th Integer field is ' + field + '.'
           );
        }
    }
    private void addDateSet(String field, Set<Object> objectSet) {
        Set<Date> dateSet = new Set<Date>();
        for (Object o : objectSet) {
            dateSet.add((Date)o);
        }

        if (aDate.isEmpty()) {
            aDate.addAll(dateSet);
            whereStrings.add(field + ' in :aDate');
        }
        else if (bDate.isEmpty()) {
            bDate.addAll(dateSet);
            whereStrings.add(field + ' in :bDate');
        }
        else if (cDate.isEmpty()) {
            cDate.addAll(dateSet);
            whereStrings.add(field + ' in :cDate');
        }
        else if (dDate.isEmpty()) {
            dDate.addAll(dateSet);
            whereStrings.add(field + ' in :dDate');
        }
        else if (eDate.isEmpty()) {
            eDate.addAll(dateSet);
            whereStrings.add(field + ' in :eDate');
        }
        else {
           throw new DuplicateException(
               'Cannot match more than 5 fields of any one type - in this case Date. '
               + 'The 6th Date field is ' + field + '.'
           );
        }
    }
    private void addDateTimeSet(String field, Set<Object> objectSet) {
        Set<DateTime> dateTimeSet = new Set<DateTime>();
        for (Object o : objectSet) {
            dateTimeSet.add((DateTime)o);
        }

        if (aDateTime.isEmpty()) {
            aDateTime.addAll(dateTimeSet);
            whereStrings.add(field + ' in :aDateTime');
        }
        else if (bDateTime.isEmpty()) {
            bDateTime.addAll(dateTimeSet);
            whereStrings.add(field + ' in :bDateTime');
        }
        else if (cDateTime.isEmpty()) {
            cDateTime.addAll(dateTimeSet);
            whereStrings.add(field + ' in :cDateTime');
        }
        else if (dDateTime.isEmpty()) {
            dDateTime.addAll(dateTimeSet);
            whereStrings.add(field + ' in :dDateTime');
        }
        else if (eDateTime.isEmpty()) {
            eDateTime.addAll(dateTimeSet);
            whereStrings.add(field + ' in :eDateTime');
        }
        else {
           throw new DuplicateException(
               'Cannot match more than 5 fields of any one type - in this case DateTime. '
               + 'The 6th DateTime field is ' + field + '.'
           );
        }
    }
    private void addBooleanSet(String field, Set<Object> objectSet) {
        Set<Boolean> booleanSet = new Set<Boolean>();
        for (Object o : objectSet) {
            booleanSet.add((Boolean)o);
        }

        if (aBoolean.isEmpty()) {
            aBoolean.addAll(booleanSet);
            whereStrings.add(field + ' in :aBoolean');
        }
        else if (bBoolean.isEmpty()) {
            bBoolean.addAll(booleanSet);
            whereStrings.add(field + ' in :bBoolean');
        }
        else if (cBoolean.isEmpty()) {
            cBoolean.addAll(booleanSet);
            whereStrings.add(field + ' in :cBoolean');
        }
        else if (dBoolean.isEmpty()) {
            dBoolean.addAll(booleanSet);
            whereStrings.add(field + ' in :dBoolean');
        }
        else if (eBoolean.isEmpty()) {
            eBoolean.addAll(booleanSet);
            whereStrings.add(field + ' in :eBoolean');
        }
        else {
           throw new DuplicateException(
               'Cannot match more than 5 fields of any one type - in this case Boolean. '
               + 'The 6th Boolean field is ' + field + '.'
           );
        }
    }

    public class DuplicateException extends Exception {}
}
