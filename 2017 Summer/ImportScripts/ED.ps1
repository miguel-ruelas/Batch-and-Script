
$xlCellTypeLastCell = 11
$xl = New-Object -comobject excel.application 
$xl.Visible = $true 
$xl.DisplayAlerts = $False 
$wb = $xl.Workbooks.Open("Y:import.xls") # <-- Change as required!
$ws = $wb.Worksheets.Item(1)
$used = $ws.usedRange          
$lastCell = $used.SpecialCells($xlCellTypeLastCell) 
$row = $lastCell.row
$Range = $ws.Cells.Item(1, 1).EntireRow  # <-- Selects the first row 
$Range.Delete()                          # <-- Deletes selection
$Range = $ws.Cells.Item(2, 1).EntireRow  # <-- Select second row
$Range.Insert(-4121)                     # <-- Insert blank row at selection
