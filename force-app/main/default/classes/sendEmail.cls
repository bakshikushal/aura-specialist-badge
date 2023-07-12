Public Class sendEmail{

    Public String Subject{get; set;}
    Public String Body{get; set;}

    Public Account acc;
    Public String accid = ApexPages.CurrentPage().getParameters().get('id');
    
    Public Account getAcc(){
    return acc;
    }    
    
    Public sendEmail(){
    acc = [select name , (select contact.name, contact.email from account.contacts) from account where
            id =: ApexPages.CurrentPage().getParameters().get('id')];
    
    }
    
    Public PageReference Send(){
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    
    PageReference PDF = Page.SamplePage1 ;    
    pdf.getParameters().put('id',(String)accid);
    PDF.setRedirect(true);
    
    Blob b = pdf.getContent();
    
    Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
    efa.setFileName('attachment.pdf');
    efa.setbody(b);
    
    String MailAddress;
    String[] AllAddress;
    
    if(acc.contacts[0] !=NULL){
        mailAddress = acc.contacts[0].email;
        integer con_size = acc.contacts.size();
        for (integer i=1 ; i < con_size ; i++){
            if(acc.contacts[i] !=NULL){
                mailAddress = mailAddress + ':' + acc.contacts[i].email;
            }
        }
        
    }
    
    AllAddress = mailAddress.split(':', 0);
         
    email.setPlainTextBody(body);
    email.setsubject(subject);
    email.settoaddresses(allAddress);  
    email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
 
    
     Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
     return null;
     }
}