/**
 * Created by User on 04.08.2021.
 */

public with sharing class UpdateStage {
    public static List<Opportunity> updateOpportunityStage(String stageNew, String stageOld) {
        List<Schema.PicklistEntry> opportunityStages = Opportunity.StageName.getDescribe().getPicklistValues();
        List<String> stagesList = new List<String>();
        for(Schema.PickListEntry entry : opportunityStages) {
            stagesList.add(entry.getValue());
        }
        System.debug(stageNew);
        System.debug(stageOld);
        System.debug(stagesList);
        if (!stagesList.contains(stageOld) && !stagesList.contains(stageNew)) {
            throw new InvalidArgumentsException('Stages are invalid');
        }
        List<Opportunity> opportunities = [
                SELECT Id, StageName
                FROM Opportunity
                WHERE StageName = :stageOld
        ];
        for (Opportunity opportunity : opportunities) {
            opportunity.StageName = stageNew;
        }
        update opportunities;
        return opportunities;
    }

    public class InvalidArgumentsException extends Exception { }
}