library(magick)
library(pdftools)
library(tesseract)

setwd(" PATH ")
pdf = " Fax PDF Document Name "
pdf_convert(pdf, format = "png", pages = NULL, filenames = NULL,
            dpi = 770, antialias = TRUE, opw = "", upw = "", verbose = TRUE)

img <- image_read(" Photo Name ") #in this case is the same name of the pdf document but with the extension .png
txt = ocr(img) # get text in vector
txt <- strsplit(t, "\n") # divide the text by row
