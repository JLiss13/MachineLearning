def PrintToCSVReport(ReportFile,Data1,Append_write):
    ReportFiletemp = open(ReportFile, Append_write)
    ReportFiletemp.write(Data1 + '\n')
    ReportFiletemp.close()

