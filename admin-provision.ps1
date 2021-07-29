$packages= @(
    "arduino",
    "bleachbit",
    "blender",
    "choco-cleaner",
    "chocolatey-core.extension",
    "chocolatey-windowsupdate.extension",
    "chocolateygui",
    "chromium",
    "cricutdesignspace",
    "cura-new",
    "etcher",
    "firefox",
    "fritzing",
    "gimp",
    "git",
    "github-desktop",
    "inkscape",
    "kicad",
    "meshroom",
    "microsoft-windows-terminal",
    "openscad",
    "prusaslicer",
    "putty",
    "python3",
    "rpi-imager",
    "sourcetree",
    "sublimetext3",
    "synctrayzor",
    "unifying",
    "vagrant",
    "virtualbox",
    "zoom"
)

# [Chocolatey](https://chocolatey.org/) is a command-line package manager for 
# Windows, rather like `apt-get` on Debian or Ubuntu, `yum` on RHEL, or `brew` 
# on macOS. It brings an efficient, understandable syntax to searching for 
# and installing common Windows apps and developer tools,  and it makes 
# provisioning and updating machines significantly easier. For more, visit the 
# [Chocolatey Documentation](https://docs.chocolatey.org/en-us/) and read 
# about its many useful [features](https://docs.chocolatey.org/en-us/features/).

$testchoco = powershell choco -v
if(-not($testchoco)){
    Write-Output "Chocolatey not found, installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Output "Chocolatey version $testchoco is already installed"
}

Write-Output "Ensuring timeliness of both Chocolatey and its installed packages..."
choco upgrade -y chocolatey
choco upgrade -y all

Write-Output "Ensuring Chocolatey packages are installed..."
ForEach ($package in $packages) {
    choco install -y $package
}
Write-Output "Done!"
