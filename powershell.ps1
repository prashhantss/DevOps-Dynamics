# Import CSV file and prompt user for lab number
$csv = Import-Csv "C:\Users\pip3kor\Desktop\powershell.ps1"
$labNumbers = $csv | Select-Object -ExpandProperty LabNumber -Unique
Write-Host "Available lab numbers:"
$labNumbers | ForEach-Object { Write-Host $_ }
$selectedLabNumber = Read-Host "Enter lab number to display related lab details:`n$($labNumbers -join ', ')"

# Find all rows with matching lab number
$results = $csv | Where-Object { $_.LabNumber -eq $selectedLabNumber }

# Display results
if ($results) {
    $results | Format-Table
} else {
    Write-Host "No results found for lab number $selectedLabNumber."
}

# Ask for corrections
$corrections = Read-Host "Are there any corrections to make? (Y/N)"
if ($corrections -eq "Y") {
    # Display one by one value for correction
    foreach ($result in $results) {
        $propertyNames = $result | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name
        foreach ($propertyName in $propertyNames) {
            $currentValue = $result.$propertyName
            $newValue = Read-Host "Enter new value for $($propertyName):`n($currentValue)"
            if ($newValue) {
                $result.$propertyName = $newValue
                Write-Host "$propertyName updated to $newValue"
            }
        }
    }
}
