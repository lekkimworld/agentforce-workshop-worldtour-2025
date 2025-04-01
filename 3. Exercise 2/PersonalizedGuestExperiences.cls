public with sharing class PersonalizedGuestExperiences {
    // Make this method available for grounding
    // the Generate_Personalized_Schedule prompt template
    @InvocableMethod(label='Generate_Personalized_Schedule')
    public static List<Response> getSessions(List<Request> reqs) {
        Request input = reqs[0];
        Contact contact = input.myContact;
        List<Session__c> sessions =
            ExperienceSessionController.getSessions(contact);

        // Create expected response
        List<Response> responses = new List<Response>();
        Response res = new Response();
        res.prompt = JSON.serialize(sessions);
        responses.add(res);
        return responses;
    }
    
    // the variables in this class used for the result 
    // must match the names used in the prompt template
    public class Request {
        @InvocableVariable(required=true)
        public Contact myContact;
    }
    public class Response {
        @InvocableVariable
        public String Prompt;
    }
}

