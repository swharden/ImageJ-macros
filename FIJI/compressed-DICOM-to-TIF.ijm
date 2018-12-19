// This ImageJ Macro (for FIJI) converts a folder of compressed DICOM files to TIF
print("\\Clear");
sourceFolder = "K:/PERSONAL/_MEDICAL_/TEST RESULTS AND IMAGING/2018-12-14 PET CT/pet 1/1.3.12.2.1107.5.1.4.60012.30000018121413400020100011163/";
sourceFileList = getFileList(sourceFolder);
for (i=0; i<sourceFileList.length; i++){
	filePath = sourceFileList[i];
	if (endsWith(filePath,".dcm")){
		print("Converting " + i+1 + " of " + sourceFileList.length + " ...");
		run("Bio-Formats Importer", "open=["+sourceFolder+filePath+"] autoscale color_mode=Grayscale rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
		saveAs("Tiff", sourceFolder+filePath+".tif");
		close();
	}
}
