/**
 * Created by User on 8/25/2021.
 */


public with sharing class countRecord {
    @AuraEnabled
    public static List<Contact> getListCountRecord(){
         return [
                 SELECT Id
                 FROM Contact
         ];

    }

    @AuraEnabled
    public static void deleteContacts(){
        delete [
                SELECT Id
                FROM Property__c
        ];
    }

}