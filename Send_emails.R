library(RDCOMClient)
OutApp <- COMCreate("Outlook.Application")
outMail = OutApp$CreateItem(0)
outMail[["To"]] = " email "
outMail[["Cc"]] = " more emails " # opcional
outMail[["subject"]] = " Subject "
outMail[["body"]] = " Email Body "
outMail[["Attachments"]]$Add(" Document PAHT ") #use for attach documents
outMail$Send()
