@RestResource(urlMapping='/studentsInfo/*')
global with sharing class StudentInformationService {
    
    global class StudentInfo {
        String studentName{get; set;}
        String studentAdress{get; set;}
        String studentPhone{get; set;}
        String schoolName{get; set;}
    }

    @httpGet
    global static StudentInfo getStudent() {
        RestRequest request = RestContext.Request;
        System.debug(request);
        String studentId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);

        student__c student = [select Id, Name, Address__c, student_name__c, phone_number__c, school__r.Name from Student__c where Id = :studentId];

        StudentInfo stdInfo = new StudentInfo();
        stdInfo.studentName = student.student_name__c;
        stdInfo.studentAdress = student.Address__c;
        stdInfo.studentPhone = student.phone_number__c;
        stdInfo.schoolName = student.school__r.Name;

        return stdInfo;
    }

}