library(RDCOMClient)

folder_name = "Folder Name"

OutApp <- COMCreate("Outlook.Application")
outlookNameSpace = OutApp$GetNameSpace("MAPI")
folder <- outlookNameSpace$Folders(1)$Folders(folder_name)
folder$Name(1)
emails <- folder$Items
attachment_file = tempfile()
emails(1)$Attachments(1)$SaveAsFile(attachment_file)
data = read.csv(attachment_file)
head(data)
