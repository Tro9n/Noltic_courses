/**
 * Created by User on 04.08.2021.
 */

@IsTest
private class UpdateStageTest {

    @IsTest
    static void updateOpportunitiesStageValidDataTest() {
        String oldStage = 'Qualification';
        String newStage = 'Prospecting';
        Test.startTest();
        List<Opportunity> oppList = UpdateStage.updateOpportunityStage(newStage, oldStage);
        System.assert(!oppList.isEmpty());
        System.assertEquals(oppList.size(), [SELECT Id FROM Opportunity WHERE Opportunity.StageName = :newStage].size());
        Test.stopTest();
    }

    @IsTest
    static void updateOpportunitiesStageWrongStageNameTest() {
        String oldStage = 'WrongStage';
        String newStage = 'DoubleWrong';
        Test.startTest();
        try {
            List<Opportunity> oppList = UpdateStage.updateOpportunityStage(newStage, oldStage);
        } catch (Exception e) {
            System.assert(e.getMessage().contains('Stages are invalid'));
        }
        Test.stopTest();
    }

    @IsTest
    static void updateOpportunitiesWithStageNotPresentTest() {
        String oldStage = 'Prospecting';
        String newStage = 'Value Proposition';
        Test.startTest();
        List<Opportunity> oppList = UpdateStage.updateOpportunityStage(newStage, oldStage);
        Test.stopTest();
        System.assert(oppList.isEmpty());
    }
}